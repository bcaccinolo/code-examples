dans les docker

# docker-compose

tu peux te connecter sur un network en dehors de ta stack 'extern'
en faisant:

```
network:
  my_ext_network:
    external: true
```

si ce network n'existe pas il sera demander de le créer.



# feature et production



