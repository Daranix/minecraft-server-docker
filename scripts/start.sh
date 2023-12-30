#!/bin/sh

echo "Minecraft version: $MINECRAFT_VERSION"
echo "Minecraft runtime: $RUNTIME_FLAVOR"
echo "Flavor version: $FLAVOR_VERSION"

mkdir -p data

if [ ! -d "$folder_path" ]; then
    # Use a case statement for switching based on the input string
    case "$RUNTIME_FLAVOR" in
        "fabric")
            curl https://meta.fabricmc.net/v2/versions/loader/$MINECRAFT_VERSION/$FLAVOR_VERSION/0.11.2/server/jar -o ./data/minecraft_server.jar
            # Add your code for option 1 here
            ;;
        "papermc")
            #latest_build = $(curl https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds | jq '.builds[-1].build')
            #echo "Latest PaperMC for version $MINECRAFT_VERSION build is: $latest_build"
            curl https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds/$FLAVOR_VERSION/downloads/paper-$MINECRAFT_VERSION-$FLAVOR_VERSION.jar -o ./data/minecraft_server.jar
            # Add your code for option 2 here
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
fi

cd data
java -Xmx2G -jar minecraft_server.jar nogui
