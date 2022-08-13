#!/bin/sh
set -eo pipefail
/wait-for.sh $BN_ARANGO_HOST:$BN_ARANGO_PORT

## foxx config allows empty values, e.g. foxx config /ANTDAO privateKey=
foxx server set default tcp://$BN_ARANGO_HOST:$BN_ARANGO_PORT

foxx upgrade /ANTDAO5 /code/foxx/ANTDAO5.zip ||
foxx install /ANTDAO5 /code/foxx/ANTDAO5.zip
foxx config /ANTDAO5 seed=$BN_SEED
foxx config /ANTDAO5 privateKey=$BN_WS_PRIVATE_KEY
foxx config /ANTDAO5 ethPrivateKey=$BN_WS_ETH_PRIVATE_KEY
foxx config /ANTDAO5 operationsTimeWindow=$BN_WS_OPERATIONS_TIME_WINDOW
foxx config /ANTDAO5 operationsLimit=$BN_WS_OPERATIONS_LIMIT

foxx upgrade /apply5 /code/foxx/apply5.zip ||
foxx install /apply5 /code/foxx/apply5.zip

foxx upgrade /ANTDAO6 /code/foxx/ANTDAO6.zip ||
foxx install /ANTDAO6 /code/foxx/ANTDAO6.zip
foxx config /ANTDAO6 seed=$BN_SEED
foxx config /ANTDAO6 wISchnorrPassword=$BN_WS_WISCHNORR_PASSWORD
foxx config /ANTDAO6 privateKey=$BN_WS_PRIVATE_KEY
foxx config /ANTDAO6 ethPrivateKey=$BN_WS_ETH_PRIVATE_KEY
foxx config /ANTDAO6 consensusSenderPrivateKey=$BN_CONSENSUS_PRIVATE_KEY
foxx config /ANTDAO6 operationsTimeWindow=$BN_WS_OPERATIONS_TIME_WINDOW
foxx config /ANTDAO6 operationsLimit=$BN_WS_OPERATIONS_LIMIT
foxx config /ANTDAO6 development=$BN_DEVELOPMENT

foxx upgrade /apply6 /code/foxx/apply6.zip ||
foxx install /apply6 /code/foxx/apply6.zip

foxx uninstall /ANTDAO4
foxx uninstall /apply4
foxx uninstall /ANTDAO3
foxx uninstall /apply3
