kubectl -n nextcloud create configmap used-images \
  --from-file=images.list=/dev/stdin \
  --dry-run=client -o yaml > used-images-cm.yaml <<'EOF'
$(kubectl -n nextcloud get pods -o jsonpath='{range .items[*]}{range .spec.containers[*]}{.image}{"\n"}{end}{end}' | sort -u)
EOF


