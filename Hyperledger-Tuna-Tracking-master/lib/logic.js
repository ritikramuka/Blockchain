'use strict';

const NS = 'org.tuna';

/**
 * Transfer tuna from one owner to another
 * @param {org.tuna.SellTuna} tx - The transferTuna transaction
 * @transaction
 */
async function sellTuna(tx) {
    const tunaRegistry = await getAssetRegistry(NS + '.Tuna');
    const restaurantOwnerRegistry = await getParticipantRegistry(NS + '.RestaurantOwner');

    const tuna = await tunaRegistry.get(tx.tuna.getIdentifier());
    if(!tuna) throw new Error(`Tuna with id ${tx.tuna.getIdentifier()} does not exist`);
    if(tuna.status !== 'CAUGHT') throw new Error(`Tuna with id ${tx.tuna.getIdentifier()} is not in CAUGHT status`);

    const restaurantOwner = await restaurantOwnerRegistry.get(tx.restaurantOwner.getIdentifier());
    if(!restaurantOwner) throw new Error(`RestaurantOwner with id ${tx.restaurantOwner.getIdentifier()} does not exist`);

    tx.tuna.owner = tx.restaurantOwner;
    tx.tuna.status = 'PURCHASED';

    await tunaRegistry.update(tx.tuna);

    let tunaSaleEvent = getFactory().newEvent(NS, 'TunaSale');
    tunaSaleEvent.tunaId = tx.tuna.tunaId;
    tunaSaleEvent.restaurantName = tx.restaurantOwner.restaurantName;
    emit(tunaSaleEvent);
}