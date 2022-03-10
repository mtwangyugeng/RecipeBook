<script>
import Content from "./Content.svelte";
import SideBar from "./SideBar.svelte";
    let currentRecipe = null
    const setCurrentRecipeId = (neo) =>{
        return () => {currentRecipeId = neo}
    }
    let currentRecipeId = null;
</script>

RecipeBook: Main
<SideBar currentRecipeId = {currentRecipeId} setCurrentRecipeId = {setCurrentRecipeId}/>
<Content />