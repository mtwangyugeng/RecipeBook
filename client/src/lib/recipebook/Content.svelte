<script>
    // TODO: Get request
    let amounts = [
        {id: 1, amount: 1, ingredient_id: 1},
        {id: 2, amount: 2, ingredient_id: 2},
        {id: 3, amount: 33, ingredient_id: 3},
    ]
    let procedures = [
        {id: 1, content: "first step"},
        {id: 2, content: "second step"},
        {id: 3, content: "third step"}
    ]

    // TODO: Load all ingredients at once to the parents
    let ingredients = [
        {name: "egg", unit: "piece"},
        {name: "cabbage", unit: "piece"},
        {name: "milk", unit: "ml"},
        {name: "water", unit: "ml"}
    ]
</script>

<section>
    <h2>Ingredients</h2>
    <ul>
    {#each amounts as {id, amount, ingredient_id} (id)}    
    <label>
        <input type="checkbox">
        {ingredients[ingredient_id].name + ": " + amount + " " + ingredients[ingredient_id].unit}
    </label>
    {/each}
    </ul>

    <h2>Steps</h2>
    <ul>
        {#each procedures as {id, content} (id)}    
            <li>
            {content}
            </li>
        {/each}
    </ul>
</section>

<style>
    section {
        background-color: pink;
    }
</style>