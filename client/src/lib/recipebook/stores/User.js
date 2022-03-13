import {writable} from 'svelte/store';

export const token = writable("");
export const user = writable("");

// reset
export const logout = () => {
    token.set("");
    user.set("");
}

export const postSignup = async (/** @type {{ email: string, password: string }} */ signupJson) => {
    const url = "/api/signup";
    const options = {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(signupJson),
    };

    const res = await fetch(url, options);
    const resJson = await res.json();
   

    token.set(resJson.token)
    user.set(resJson.user);
}

export const postSignin = async (/** @type {{ email: string, password: string }} */ signupJson) => {
    const url = "/api/login";
    const options = {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(signupJson),
    };

    const res = await fetch(url, options);
    const resJson = await res.json();
   
    token.set(resJson.token)
    user.set(resJson.user);
}

