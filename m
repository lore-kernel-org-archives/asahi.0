Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5F2582
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:52:07 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17683b570b8so16430177fac.13
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nZRYMXkXMuH4jLnE9DwtMk8EvGIG54ns0arYzcO6DM=;
        b=WQGD7VE2RLizutWV8oj2BEh7aeup2PtzJ9z7+As2c3K22fLI66OxNEWdHt4wyIFRYV
         7Pm6QEAEH21ObvA019rq5fgYLr+ZpTX/dbTwkWZe1Br7ot64819ByuGPFgxgwdM/QZd1
         D2VJcD07q41GZl62Cj1gU64P5IW2DZX13gm4++8y/dRzGPwhcRV8/AFIxXcZ7XK4Q5KR
         1sOEpnoi9SG98Ja6ydM1IP9kUUZven2rBTehUwrqjvTnE9+m+UbO9jg/V6/V5hFF49Uw
         +T8Q07oKBIF/tV0flCSxaMIbJWXv+nxZGXWxEkPa1vUOReDhPj6oaQll7cQH3/7OfJ/z
         Eh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZRYMXkXMuH4jLnE9DwtMk8EvGIG54ns0arYzcO6DM=;
        b=y3KzTJJmt+dXG1pcTCDK8m7bp4JphgNVUOglykHDzx06LuTGXCLbgF1kWtMlgY+a35
         KuaqVlbLfnPy1s5uv9POwIEsNySg6jGYJ75HESurycB1nV2PiANElFF3nZxPrtThg8P4
         3pPbCxAL0Prg/+gI0a8FkSkeuoo/zT4WNr/vPAwME4Ic6hYUM65PYWGH2sFsPAjTJ7LX
         V+0Smyqld4HMQ5dy1FSDrwAHUXa92tJeGdZJFV95NQP/nALsm3ZEzbL4ip/8QUQV5wZa
         AebbrmspK1woh8vru8iPGatCBFKAO0ZvTFOCEwrVupA/JKqo65+vocYhJMvhrhlIiFvZ
         AoKQ==
X-Gm-Message-State: AAQBX9eHpC6mqGHNvXtGSGXMHeaa6ZugKWaksCW/jqwl8gtlkkj0UHZS
	ovDEWWyzvkmTYfD50fQfXkc=
X-Google-Smtp-Source: AKy350az8V8n53MAaV6Ss+bLCfROdWnTd1OvypXw9n+hjQh6aj7aqpHlTBRfEaBBeVbyyKqk8QEPeQ==
X-Received: by 2002:a05:6870:9591:b0:177:b0ee:b034 with SMTP id k17-20020a056870959100b00177b0eeb034mr11073610oao.43.1680101527152;
        Wed, 29 Mar 2023 07:52:07 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id a20-20020a9d74d4000000b006a11998d20esm5940720otl.45.2023.03.29.07.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:52:06 -0700 (PDT)
Message-ID: <5c8c004e-f04f-febc-783e-13cbb8129688@gmail.com>
Date: Wed, 29 Mar 2023 11:52:03 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/6] rust: error: Add to_result() helper
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: Fox Chen <foxhlchen@gmail.com>, Andreas Hindborg
 <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-4-3900319812da@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-4-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> [...]
> 
> +
> +/// Converts an integer as returned by a C kernel function to an error if it's negative, and
> +/// `Ok(())` otherwise.
> +pub fn to_result(err: core::ffi::c_int) -> Result {
> +    if err < 0 {
> +        Err(Error::from_errno(err))
> +    } else {
> +        Ok(())
> +    }
> +}
> 

Reviewed-by: Martin Rodriguez Reboredo
