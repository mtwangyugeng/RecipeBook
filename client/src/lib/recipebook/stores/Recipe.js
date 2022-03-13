import {writable} from 'svelte/store'

export const recipes = writable([]); 

export const postRecipe = async ({title}, token) => {
    const url = "/api/recipes";
    const options = {
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
            "Authorization": `Bearer ${token}`
        },
        body: JSON.stringify({title}),
    };
    const res = await fetch(url, options);
    if (res.status == 201) {
        const resJson = await res.json();
        recipes.set(resJson)
        console.log(resJson)
    }

}
// just name and id
export const getRecipes = async () => {
    const url = "/api/recipes";

    const res = await fetch(url);
    if (res.status == 200) {
        const resJson = await res.json();
        recipes.set(resJson)
        console.log(resJson)
    }
}


export const updateRecipe = async () => {
    const url = "/api/signup";
    const res = await fetch(url);
    const resJson = await res.json();
    
}

export const deleteRecipe = async () => {
    
}
