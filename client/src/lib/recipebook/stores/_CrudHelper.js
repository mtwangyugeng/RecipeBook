export const getCrudApi = (impUrl, writableArr) => {
    return {
        getAll: async () => {
            const url = impUrl;
        
            const res = await fetch(url);
            if (res.status == 200) {
                const resJson = await res.json();
                writableArr.set(resJson);
            }
        },

        post: async (impJson, token) => {
            const url = impUrl;
            const options = {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json',
                    "Authorization": `Bearer ${token}`
                },
                body: JSON.stringify(impJson),
            };
            const res = await fetch(url, options);
            if (res.status == 201) {
                const resJson = await res.json();
                writableArr.update(prev => {
                    const res = [...prev, resJson]
                    return res
                })
            }
            return res.status
        },

        update: async (id, impJson, token) => {
            const url = impUrl + `/${id}`;
            const options = {
                method: "PATCH",
                headers: {
                    'Content-Type': 'application/json',
                    "Authorization": `Bearer ${token}`
                },
                body: JSON.stringify(impJson),
            };
        
            const res = await fetch(url, options);
            if (res.status == 202) {
                const resJson = await res.json();
                writableArr.update(prev => {
                    let i = prev.findIndex(v => v.id === id);
                    const res = [...prev]
                    res[i] = resJson
                    return res
                })
            }
            return res.status
        },

        delete: async (id, token) => {
            const url = impUrl + `/${id}`;
            const options = {
                method: "DELETE",
                headers: {
                    'Content-Type': 'application/json',
                    "Authorization": `Bearer ${token}`
                },
            };
            const res = await fetch(url, options);
            if (res.status == 303) {
                writableArr.update(prev => {
                    const res = prev.filter(v => v.id !== id)
                    return res
                })
            }
            return res.status
        }
    };
}