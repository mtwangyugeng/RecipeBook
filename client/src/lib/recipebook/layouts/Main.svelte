<script>
import TopBar from './topbar/TopBar.svelte'
import BottomContainer from './BottomContainer.svelte' 
import Ingredients from './ingredients/Ingredients.svelte';
import Recipes from './recipes/Recipes.svelte';

const tabs = ['Ingredients', 'Recipes', "Shopping List"]
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
        {:else if currentTab === "Shopping List"}
            TODO
        {/if}
    </BottomContainer>
</section>


<style>
    section {
        height:100%
    }
</style>