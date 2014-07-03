;;; zygospore.el --- reversible C-x 1 (delete-other-windows)

;; Copyright (C) 2014 by Louis Kottmann

;; Author: Louis Kottmann <louis.kottmann@gmail.com>
;; URL: https://github.com/louiskottmann/zygospore.el
;; Version: 0.0.2

;; This program is free software; you can redistribute it and-or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http:--www.gnu.org-licenses->.

;;; Commentary:

;; Press C-x 1 again to restore windows!

;; Install:
;; Test it out with M-x zygospore-toggle-delete-other-windows RET (twice, on a frame with multiple windows)

;; To make it permanent, add this line to your init.el:
;; (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;;; Code:

(defvar zygospore-spore-formation-register-name
  "zygospore-windows-time-machine"
  "Name of the register that zygospore uses to reverse `zygospore-delete-other-windows'.")

(defvar zygospore-last-full-frame-window
  nil
  "Last window that was full-frame'd.")

(defvar zygospore-last-full-frame-buffer
  nil
  "Last buffer that was full-frame'd.")

(defun zygospore-delete-other-window ()
  "Save current window-buffer configuration and full-frame the current buffer."
  (setq zygospore-last-full-frame-window (selected-window))
  (setq zygospore-last-full-frame-buffer (current-buffer))
  (window-configuration-to-register zygospore-spore-formation-register-name)
  (delete-other-windows))

(defun zygospore-restore-other-windows ()
  "Restore the window configuration to prior to full-framing."
  (jump-to-register zygospore-spore-formation-register-name))

;;;###autoload
(defun zygospore-toggle-delete-other-windows ()
  "Main zygospore func.
If the current frame has several windows, it will act as `delete-other-windows'.
If the current frame has one window,
	and it is the one that was last full-frame'd,
	and the buffer remained the same,
it will restore the window configuration to prior to full-framing."
  (interactive)
  (if (and (equal (selected-window) (next-window))
           (equal (selected-window) zygospore-last-full-frame-window)
           (equal (current-buffer) zygospore-last-full-frame-buffer))
      (zygospore-restore-other-windows)
    (zygospore-delete-other-window)))

(provide 'zygospore)
;;; zygospore.el ends here
