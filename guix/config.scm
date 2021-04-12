;; This is an operating system configuration template
;; for PantherX core Desktop

(use-modules (gnu)
             (gnu packages certs)
             (gnu packages fonts)
             (gnu packages kde-frameworks)
             (gnu packages gnome)
	           (guix packages)
             (px packages accounts)
             (px packages desktop)
             (px services desktop)
             (px system)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (srfi srfi-1))

(use-package-modules screen ssh certs tls version-control rsync vim
                     admin tmux)

(use-service-modules docker sddm xorg)

(operating-system
  (host-name "panther.local")
  (timezone "Asia/Tehran")
  (locale "en_US.utf8")

  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (target "/boot/efi")
                (menu-entries (list
                  (menu-entry
                    (label "Arch Linux")
                    (linux "/boot/vmlinuz-linux")
                    (linux-arguments '(
                      "load_video"
                      "gfxpayload=keep" ; set
                      "insmod gzio"
                      "insmod part_gpt"
                      "insmod fat"
                      "root=/dev/sda3"))
                    (initrd "/boot/initramfs-linux.img"))))))

  (file-systems (cons* (file-system
                         (device (file-system-label "my-root"))
                         (mount-point "/")
                         (type "ext4"))
                       (file-system
                         (mount-point "/home")
                         (device "/dev/sda4")
                         (type "ext4"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device "/dev/sda1")
                         (type "vfat"))
                       %base-file-systems))

  (swap-devices '("/dev/sda2"))

  (users (cons* (user-account
                  (name "panther")
                  (comment "PantherX default user")
                  (group "users")
                  (supplementary-groups '("wheel" "netdev"
                                          "kvm" "docker"
                                          "audio" "video")))
                %base-user-accounts))

  (skeletons (pantherx-skeletons))

  ;; Globally-installed packages.
  (packages (cons* openssh nss-certs gnutls
                   git vim rsync ;; development
                   screen ;; terminal window manager
                   tmux ;; personal packages
                   wpa-supplicant
                   %pantherx-packages))

  ;; Add services to the baseline
  (services (cons* (service sddm-service-type
                            (sddm-configuration
                              (minimum-uid 1000)
                              (theme "darkine")
                              (xorg-configuration
                                (xorg-configuration
                                  (extra-config `("Section \"InputClass\"\n"
                                                  "   Identifier \"touchpad\"\n"
                                                  "   Driver \"libinput\"\n"
                                                  "   MatchIsTouchpad \"on\"\n"
                                                  "   Option \"Tapping\" \"on\"\n"
                                                  "EndSection\n"
                                                  "\n"))))))
                   (service docker-service-type)
                   (service elogind-service-type
                            (elogind-configuration
                             (idle-action 'suspend)
                             (idle-action-seconds (* 60 5))))
		   (service sysctl-service-type
			    (sysctl-configuration
			      (settings '(("fs.inotify.max_user_watches" . "524288")))))
                   (remove (lambda (svc)
                             (or (eq? (service-kind svc) sddm-service-type)
                                 (eq? (service-kind svc) elogind-service-type)))
                           %pantherx-services)))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
