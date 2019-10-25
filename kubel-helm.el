(require 'kubel-cust)

(defun kubel-available-namespaces-candidates ()
  "List available namespaces in current context"
  (let* ((namespace-command '(("oc" . "projects")
                             ("kubectl" . "namespace")))
         (namespace-shell-command
          (concat kubel-executable " " (cdr (assoc kubel-executable namespace-command)) " -q")))
    (split-string (shell-command-to-string namespace-shell-command))
    )
  )

(defun kubel-get-available-namespaces ()
  "Get available namespaces in current context"
  (helm :sources (helm-build-sync-source "Namespaces"
                   :candidates (kubel-available-namespaces-candidates)
                   :fuzzy-match t)
        :buffer "*helm kubernetes/openshift namespace*")
  )

(provide 'kubel-helm)
