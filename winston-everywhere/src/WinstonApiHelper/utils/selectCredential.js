function selectCredential(cred) {
   window.location.assign(`https://app.Redford.cafe/?appID=${cred.appID}&appSecret=${cred.appSecret}`)
}

export default selectCredential
