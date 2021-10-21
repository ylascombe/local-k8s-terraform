# FAQ

# kubectl did not work after kind cluster creation

On some laptop, it didn't work and we do not have understood why, so you can use:
- `kubectl get po -A --kubeconfig {project.root}/kube_config.yaml` to specify which config file to use
- `kind export kubeconfig --name demo` to exprt config in ~/.kube/config file 

# Error : nf_conntrack_max: permission denied

Logs:
```sh
⇒  kubectl get po -A
NAMESPACE            NAME                                         READY   STATUS             RESTARTS   AGE
kube-system          coredns-66bff467f8-vvrcv                     0/1     Pending            0          28s
kube-system          coredns-66bff467f8-xh5z8                     0/1     Pending            0          28s
kube-system          etcd-demo-control-plane                      1/1     Running            0          44s
kube-system          kindnet-xtcjk                                1/1     Running            0          28s
kube-system          kube-apiserver-demo-control-plane            1/1     Running            0          44s
kube-system          kube-controller-manager-demo-control-plane   1/1     Running            0          44s
kube-system          kube-proxy-hxmfv                             0/1     CrashLoopBackOff   2          28s
kube-system          kube-scheduler-demo-control-plane            1/1     Running            0          44s
local-path-storage   local-path-provisioner-bd4bb6b75-ls42j       0/1     Pending            0          28s
yohan.lascombe@AMAC02WG2P8HTD6:~/projects/rd/local-k8s/terraform/01-provision|main⚡
⇒  kubectl logs kube-proxy-hxmfv -n kube-system
W0830 09:09:01.159891       1 server_others.go:559] Unknown proxy mode "", assuming iptables proxy
I0830 09:09:01.174239       1 node.go:136] Successfully retrieved node IP: 172.19.0.2
I0830 09:09:01.174319       1 server_others.go:186] Using iptables Proxier.
I0830 09:09:01.174717       1 server.go:583] Version: v1.18.2
I0830 09:09:01.175233       1 conntrack.go:100] Set sysctl 'net/netfilter/nf_conntrack_max' to 163840
F0830 09:09:01.175340       1 server.go:497] open /proc/sys/net/netfilter/nf_conntrack_max: permission denied
```

Workaround/fix :
TODO : fix it with code
```
docker run -it --rm --privileged --pid=host justincormack/nsenter1
/ # sudo sysctl net/netfilter/nf_conntrack_max=163840
/bin/sh: sudo: not found
/ # sysctl net/netfilter/nf_conntrack_max=163840
net.netfilter.nf_conntrack_max = 163840
```

