<template>
    <header class="header">
        <div id="nav">
            <router-link to="/">Home</router-link> |
            <router-link to="/about">About</router-link>
        </div>
        <h1 class="threeD">init_script web ui</h1>
    </header>
</template>

<script>
export default {
    name: "Header"
}
</script>

<style scoped>

    .threeD {
    color: white;
    white-space: nowrap;
    font-size: 3em;
    font-family: sans-serif;
    text-shadow: 1px 1px 0 grey, 1px 2px 0 grey, 1px 3px 0 grey, 1px 4px 0 grey,
        1px 5px 0 grey, 1px 6px 0 grey, 1px 7px 0 grey, 1px 8px 0 grey,
        5px 13px 15px black;
    }

    .header {
        background: #333;
        color: #fff;
        text-align: center;
        padding: 10px;
    }

    .header a {
        color: #fff;
        padding-right: 5px;
        text-decoration: none;
    }

</style>