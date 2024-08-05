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

print("hello222")
_services={}

#_services={"hello"=Service{
#        "image" = "ghcr.io/xline-kv/xline:latest"
#    }
#}
#_services["hello2"]=Service{
#    "image" = "ghcr.io/xline-kv/xline:latest"
#}
#_services{"hello3":Service{
#    "image" = "ghcr.io/xline-kv/xline:latest"
#    }
#}
#_services.hello4=Service{
#    "image" = "ghcr.io/xline-kv/xline:latest"
#}

_name="xline"+str(1)
_services = _services | {_name = Service {
    "image" = "ghcr.io/xline-kv/xline:latest"
}}

_result = [(lambda x: int -> int {
    print("hello")
    _name="xline"+str(x)
    
    _services = _services | {_name = Service {
        "image" = "ghcr.io/xline-kv/xline:latest"
    }}
    x
})(x) for x in range(0,option("count",default=5))]


Compose{
    services=_services
}