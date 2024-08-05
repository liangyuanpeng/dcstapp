schema Compose:
    version?: str
    services: {str: Service}

schema Service:
    image: str 
    restart?: str 
    entrypoint?: str 
    command?: [str]
    network_mode?: str 
    volumes?: [str]
    entrypoint?: str

_services={}

_services=services = {
    "xline{}".format(x) = {
        image = "ghcr.io/xline-kv/xline:latest"
    } for x in range(0,option("count",default=5))
}

Compose{
    services=_services
}
