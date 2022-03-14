<script>
  import {recipes, recipesCrud} from "./lib/recipebook/stores/Recipe";
  import {token, postSignin} from "./lib/recipebook/stores/User";

  // Recipe
  recipesCrud.getAll().then(()=>console.log($recipes));
  postSignin({email:"test@test.com", password:"sample"}).then(()=>{
	  console.log($token);
  	recipesCrud.post({title: "newly post"}, $token).then(()=>console.log($recipes));;
    recipesCrud.update(10, {title: "what"}, $token).then(()=>console.log($recipes));
    recipesCrud.delete(21,  $token).then(()=>console.log($recipes));
  });
</script>