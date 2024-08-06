FROM xhofe/alist:latest
EXPOSE 5244
CMD ["alist", "server", "--port", "5244"]
