<script>
    const getRecipes = async () => {
        const res = await fetch('/api/recipes')
        const text = await res.text();
        if (res.ok) {
            console.log("reee " + text)
            return text;
        } else {
            throw new Error(text)
        }
    }
    let promise = getRecipes();
</script>
hidaa
{#await promise}
    <p>...waiting</p>
{:then recipes} 
    <p>{recipes}</p>
{/await}