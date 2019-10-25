(defgroup kubel nil
  ""
  :group 'tools
  :prefix "kubel-")


(defcustom kubel-executable
  (if (locate-file "oc" exec-path exec-suffixes 1)
      "oc"
    "kubectl")
  "The kubectl command used for Kubernetes/Openshift commands."
  :group 'kubel
  :type 'string
  )

(provide 'kubel-cust)
