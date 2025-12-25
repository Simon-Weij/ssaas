<!--
 Copyright (c) 2025 Simon-Weij
 
 This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0. If a copy of the MPL was not distributed with this
 file, You can obtain one at https://mozilla.org/MPL/2.0/.
-->

<script lang="ts">
	export let open: boolean = false;
	export let onCreate: (settings: any) => void = () => {};

	function handleClose() {
		open = false;
	}

	let vmName = '';
	let ram = 4;
	let cputhreads = 4;
	let diskSize = 20;
	let os = 'ubuntu';

	let options = ['debian', 'ubuntu', 'alpine', 'rocky', 'fedora coreos'];
</script>

<dialog class="modal" class:modal-open={open} {open} on:close={handleClose}>
	<div class="modal-box">
		<h3 class="mb-4 text-lg font-bold">Create Virtual Machine</h3>

		<div class="mb-4 grid grid-cols-[100px_1fr] items-center gap-2">
			<span>VM Name</span>
			<input
				type="text"
				id="vmName"
				bind:value={vmName}
				class="input-bordered input"
				placeholder="Enter VM name"
			/>
		</div>

		<div class="mb-4 grid grid-cols-[100px_1fr] items-center gap-2">
			<span>CPU Threads: {cputhreads}</span>
			<input
				type="range"
				id="cputhreads"
				min="1"
				max="16"
				bind:value={cputhreads}
				class="range range-primary"
			/>
		</div>

		<div class="mb-4 grid grid-cols-[100px_1fr] items-center gap-2">
			<span>RAM: {ram} GB</span>
			<input type="range" id="ram" min="1" max="64" bind:value={ram} class="range range-primary" />
		</div>

		<div class="mb-4 grid grid-cols-[100px_1fr] items-center gap-2">
			<span>Disk Size: <br /> {diskSize} GB</span>
			<input
				type="range"
				id="diskSize"
				min="10"
				max="1000"
				bind:value={diskSize}
				class="range range-primary"
			/>
		</div>

		<div class="mb-4 grid grid-cols-[100px_1fr] items-center gap-2">
			<span>Operating System</span>
			<select id="os" bind:value={os} class="select-bordered select cursor-pointer">
				{#each options as option}
					<option value={option}>{option}</option>
				{/each}
			</select>
		</div>

		<div class="modal-action">
			<button class="btn btn-primary" on:click={() => { onCreate({vmName, cpuThreads: cputhreads, ram, diskSize, os}); open = false; }}>Create VM</button>
		</div>
	</div>
	<form method="dialog" class="modal-backdrop">
		<button>close</button>
	</form>
</dialog>
