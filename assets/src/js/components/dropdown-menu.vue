﻿
<script>
    import dropdownSubmenu from "./dropdown-submenu";
    export default {
        name: "dropdownMenu",
        template: '#dropdown-menu-template',
        data: {
            selectedNode: null
        },
        props: {
            nodes: {
                type: Array,
                default: []
            }
        },
        created: function () {
            for (var node = 0; node < this.nodes.length; node++) {
                if (this.nodes[node].hasOwnProperty("IsActive")) {
                    this.nodes[node]["IsActive"] = false;
                }
            }
        },
        methods: {
            nodeClicked: function (node) {

                node.IsActive = !node.IsActive;

                if (typeof this.selectedNode !== "undefined" && this.selectedNode !== node) {
                    this.selectedNode.IsActive = false;
                }

                if (typeof this.selectedNode !== "undefined") {
                    this.selectedNode.Categories = this.selectedNode.Categories.map(c => {
                        if (c.IsActive == true)
                            c.IsActive = false;
                        return c;
                    });
                }

                this.selectedNode = node;
            }
        },
        components: {
            dropdownSubmenu
        }
    };
</script>