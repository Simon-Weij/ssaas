<!--
 Copyright (c) 2025 Simon-Weij
 
 This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0. If a copy of the MPL was not distributed with this
 file, You can obtain one at https://mozilla.org/MPL/2.0/.
-->

<script lang="ts">
	import Card from '../../components/card.svelte';
	import PlusIcon from '../../components/icons/plusIcon.svelte';
	import Modal from '../../components/modal.svelte';

	interface VM {
		vmName: string;
		cpuThreads: number;
		ram: number;
		diskSize: number;
		os: string;
	}

	let vms: any[] = [];
	let showModal = false;

	function createVM(settings: VM) {
		console.log('Creating VM with settings:', settings);
	}
</script>

<main>
	{#if vms.length === 0}
		<p class="mt-8 text-center text-gray-200">
			No virtual machines yet, create one to get started.
		</p>
	{:else}
		<div class="container mx-auto flex flex-wrap justify-center gap-2 px-8 py-4">
			{#each vms as vm}
				<Card image={vm.image} alt={vm.alt} title={vm.title} paragraph={vm.paragraph} />
			{/each}
		</div>
	{/if}
	<div class="dock">
		<button on:click={() => (showModal = true)}>
			<PlusIcon />
			<span class="dock-label">Add</span>
		</button>
	</div>
</main>

<Modal bind:open={showModal} onCreate={createVM} />
