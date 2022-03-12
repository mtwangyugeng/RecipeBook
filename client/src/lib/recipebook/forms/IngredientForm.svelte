<form>
    <label for="content">Ingredient name:
        <input type="text" id="name" name="name" placeholder="Enter ingredient name">
    </label>
    <select name="unit" id="unit">
        <optgroup label="Weight">
            <option value="kg">kg</option>
            <option value="g">g</option>
            <option value="lb">lb</option>
        </optgroup>
        <optgroup label="volumn">
            <option value="L">L</option>
            <option value="ml">ml</option>
            <option value="oz">oz</option>
        </optgroup>
        <optgroup label="whole">
            <option value="peice">peice</option>
        </optgroup>
    </select>
    <input type="submit" value="Submit">
</form>


<style>
    form {
        display: flex;
        justify-content: space-around;
        padding: 20px;
    }

    form > input[type="submit"] {
        background-color: yellow;
    }
</style>