<template>
    <div v-if="model">
        <template v-if="type == 'text'">
            <label :class="labelClasses" :for="inputId">{{ label }}</label>
            <input :id="inputId" :name="inputName" type="text" :class="inputClasses" v-model="value" v-on:input="handleInput" v-on:change="handleChange">
            <span :class="errorClasses">{{ errorMessage }}</span>
        </template>
    </div>
</template>
<script>
    export default {
        name: "inputField",
        data: function () {
            return {
                value: null,
                errorMessage: null
            }
        },
        props: {
            model: {
                default: null
            },
            addressType: {
                default: null
            },
            label: {
                default: ''
            },
            fieldName: {
                default: ''
            },
            type: {
                default: 'text'
            },
            required: {
                type: Boolean,
                default: false
            },
            inputClasses: {
                default: ''
            },
            labelClasses: {
                default: ''
            },
            errorClasses: {
                default: 'field-validation-error text-danger'
            }
        },
        computed: {
            inputId: function () {
                return this.addressType + '_' + this.fieldName;
            },
            inputName: function () {
                return this.addressType + '.' + this.fieldName;
            }
        },
        created: function () {
            this.value = this.model ? this.model[this.addressType][this.fieldName] : null;
        },
        methods: {
            getValue: function () {
                return this.value;
            },
            handleInput: function () {
                this.errorMessage = '';
            },
            handleChange: function () {
                this.model[this.addressType][this.fieldName] = this.value;

                this.validate((valid, message) => {
                    this.errorMessage = message;
                });
            },
            validate: function (callback) {
                var me = this;
                var value = this.getValue();
                var name = this.inputName;

                if (!this.required && !value) {
                    callback(true, null);
                    return;
                }

                this.$root.submit(name, false, callback);
            }
        }
    };
</script>
