<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title> Knucklebones Score Keeper </q-toolbar-title>
        <q-btn
          flat
          dense
          round
          icon="refresh"
          aria-label="Menu"
          @click="reset"
        />
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup lang="ts">
defineOptions({
  name: 'MainLayout',
});

function reset() {
  window.location.reload();
}
</script>
