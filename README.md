# Name.com Dynamic DNS

Dynamic DNS Script for Name.com

---

## Usage

### Docker
```bash
sudo docker container run -d \
    --restart unless-stopped \
    --name DDNS \
    --env USERNAME=myusername \
    --env TOKEN=mytoken1234567890 \
    --env DOMAINNAME=mydomain.name \
    --env HOST=www \
    --env TYPE=A \
    ilolm/name-com-ddns
```

---

### Docker Compose
```yaml
version: "3"
services:
  name-com-ddns:
    image: ilolm/name-com-ddns
    restart: unless-stopped
    environment:
      - USERNAME=myusername
      - TOKEN=mytoken1234567890
      - DOMAINNAME=mydomain.name
      - HOST=www
      - TYPE=A  # Optional, default: A
```

---

### With CMD

```bash
git clone https://github.com/ilolm/name-com-ddns.git

USERNAME=myusername \
TOKEN=mytoken1234567890 \
DOMAINNAME=mydomain.name \
HOST=www \
TYPE=A \  # Optional, default: A
./name-com-ddns/run.sh
```
