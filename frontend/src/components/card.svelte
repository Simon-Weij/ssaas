<script lang="ts">
	import Arrow from "./icons/arrow.svelte";
	import { goto } from '$app/navigation';

  export let image;
  export let alt;
  export let title;
  export let paragraph;
</script>

<div class="card bg-base-100 w-96 shadow-sm border border-base-300">
  
  <figure>
    <img
      src={image}
      alt={alt}
      class="w-48 h-auto mx-auto primary" />
  </figure>
  <div class="card-body">
    <h2 class="card-title">{title}</h2>
    <p>{paragraph}</p>
    <div class="card-actions justify-end">
      <button class="btn" on:click={() => goto('/vm')}><Arrow /></button>
    </div>
  </div>
</div>