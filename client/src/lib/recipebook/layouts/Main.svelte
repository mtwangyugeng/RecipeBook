<script>
import TopBar from './topbar/TopBar.svelte'
import BottomContainer from './BottomContainer.svelte' 
import Ingredients from './ingredients/Ingredients.svelte';
import Recipes from './recipes/Recipes.svelte';
import ShoppingLists from './shoppinglists/ShoppingLists.svelte';

const tabs = ['Ingredients', 'Recipes', "Shopping Lists"]
let currentTab = tabs[0];
const switchTab = (imp) => {
    currentTab = imp
}
</script>


<section>
    <TopBar tabs={tabs} currentTab={currentTab} switchTab={switchTab} />
    <BottomContainer>
        {#if currentTab === "Ingredients"}
            <Ingredients />
        {:else if currentTab === "Recipes"}
            <Recipes />
        {:else if currentTab === "Shopping Lists"}
            <ShoppingLists />
        {/if}
    </BottomContainer>
</section>


<style>
    section {
        height:100%
    }
</style>