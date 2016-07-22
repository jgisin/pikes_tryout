  var paymentForm = new SqPaymentForm({
    applicationId: '1', // <-- Add your application ID here
    inputClass: 'sq-input',
    inputStyles: [
      {
        fontSize: '15px'
      }
    ],
    cardNumber: {
      elementId: 'sq-card-number',
      placeholder: '•••• •••• •••• ••••'
    },
    cvv: {
      elementId: 'sq-cvv',
      placeholder: 'CVV'
    },
    expirationDate: {
      elementId: 'sq-expiration-date',
      placeholder: 'MM/YY'
    },
    postalCode: {
      elementId: 'sq-postal-code'
    },
    callbacks: {
      cardNonceResponseReceived: function(errors, nonce, cardData) {
        if (errors) {
          // handle errors
          errors.forEach(function(error) { console.log(error.message); });
        } else {
          // handle nonce
          console.log('Nonce received:');
          console.log(nonce);
        }
      },
      unsupportedBrowserDetected: function() {
        // Alert the buyer that their browser is not supported
      },
      inputEventReceived: function(inputEvent) {
        switch (inputEvent.eventType) {
          case 'focusClassAdded':
            // Handle as desired
            break;
          case 'focusClassRemoved':
            // Handle as desired
            break;
          case 'errorClassAdded':
            // Handle as desired
            break;
          case 'errorClassRemoved':
            // Handle as desired
            break;
          case 'cardBrandChanged':
            // Handle as desired
            break;
          case 'postalCodeChanged':
            // Handle as desired
            break;
        }
      }
    }
  });

  function requestCardNonce() {
    paymentForm.requestCardNonce();
  }
