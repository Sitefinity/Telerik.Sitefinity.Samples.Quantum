<script>
    export default {
        name: "dropdownSubmenu",
        template: '#dropdown-submenu-template',
        data: {
            selectedNode: null
        },
        props: {
            parentNode: {
                type: Object,
                default: []
            }
        },
        computed: {
            isParentOpen: function () {
                return this.parentNode.IsActive;
            }
        },
        created: function () {
            this.parentNode.IsActive = false;
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
        }
    };
</script>