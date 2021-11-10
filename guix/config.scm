;; My operating system configuration for PantherX OS
;; Time-stamp: <2021-11-10 14:39:21 panther>
;; for PantherX core Desktop

(use-modules (gnu)
             (gnu packages admin)
             (gnu packages emacs)
             (gnu packages rsync)
             (gnu packages screen)
             (gnu packages ssh)
             (gnu packages tmux)
             (gnu packages version-control)
             (gnu packages vim)
             (gnu services desktop)
             (gnu services docker)
             (gnu services sddm)
             (gnu services xorg)
             (px services desktop)
             (px services security-token)
             (px system install))

;;;
;;; Service customizations
;;;

(define (modified-sddm-service-config config)
  (sddm-configuration
   (inherit config)
   (xorg-configuration
    (xorg-configuration
     (extra-config `("Section \"InputClass\"\n"
                     "   Identifier \"touchpad\"\n"
                     "   Driver \"libinput\"\n"
                     "   MatchIsTouchpad \"on\"\n"
                     "   Option \"Tapping\" \"on\"\n"
                     "EndSection\n"
                     "\n"))))))

;;;
;;; Operating system definition
;;;

(px-desktop-os
 (operating-system
  (host-name "panther.local")
  (timezone "Asia/Tehran")
  (locale "en_US.utf8")

  (bootloader (bootloader-configuration
               (bootloader grub-efi-bootloader)
               (targets '("/boot/efi"))
               (menu-entries
                (list
                 (menu-entry
                  (label "Manjaro Linux")
                  (linux "/boot/vmlinuz-5.10-x86_64")
                  (linux-arguments '("load_video" "gfxpayload=keep" ; set
                                     "insmod gzio" "insmod part_gpt"
                                     "insmod fat" "root=/dev/sda3"))
                  (initrd "/boot/initramfs-5.10-x86_64.img"))))))

  (file-systems
   (cons* (file-system
           (device (file-system-label "PX-ROOT"))
           (mount-point "/")
           (type "ext4"))
          (file-system
           (mount-point "/home")
           (device "/dev/sda5")
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

  ;; Globally-installed packages.
  (packages (cons*
             ;; networking
             openssh wpa-supplicant
             ;; development
             git vim emacs
             ;; tools
             rsync screen tmux
             %px-desktop-packages))

  ;; System services
  (services
   (cons*
    (service docker-service-type)

    (ledger-wallet-service)
    (nitro-key-service)

    (modify-services %pantherx-services
                     (sddm-service-type config => (modified-sddm-service-config config))
                     (elogind-service-type config => (elogind-configuration
                                                      (inherit config)
                                                      (idle-action 'suspend)
                                                      (idle-action-seconds (* 60 5)))))))
  ))
