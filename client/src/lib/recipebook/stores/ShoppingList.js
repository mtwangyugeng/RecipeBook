import {writable} from 'svelte/store'

export const shoppingLists = writable([
    {
        id: 1,
        name: "List A"
        //created_at;
        //updated_at;
    },
    {
        id: 2,
        name: "List B"
        //created_at;
        //updated_at;
    }
]);