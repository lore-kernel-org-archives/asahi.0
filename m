Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6C2582
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 14:49:49 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id bi31so11741831oib.9
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680101389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRqpC2pNLFE0BwqBPX96lUg22eDDLB+g7ixyozfNakU=;
        b=iMG/FLKtqXGOz1EhsGEHAlEIa33i0ikt2fvQ9xAImPoNz8MT1oWTcp4cAcDKRjhjO8
         zsPV4Pc2bo17qw2PI7BD+NYAkDBxCFbmZ20eGUWLomD0TCJZ0M7/SYJkNrf369ybiQxx
         6/KTfQQxvAzeeGZ9emrm8EpyKFvzqX59A/NdQiPML8pxM61+ktxZrTg8sRSlCzKMJKBZ
         TPmyYsVrdG8yYU8Y/oiNuMS8zy3EIqyB17m/6alrn/HKl/CSj6cFX3EOgkcoiMgSuZGX
         EFCWfi4Q+ma447ADUJjewkpeY7vMDtCzmOM8iRG7TxDOqm0uoos94PH4AMRiunZx7hTl
         lWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRqpC2pNLFE0BwqBPX96lUg22eDDLB+g7ixyozfNakU=;
        b=xxFsUf/N27GtIlBZm1OxTdr5jVelPpGXV/FaKi8UKmqcBHO+0iBaX4iuj6U4W4zLg+
         BKWWhqqNnSvQYvNvKd729MBdY9pBGSmSrmJfs999Z2gdprEc/EKgVTym1qN6n4moR9hL
         k1ntGd1r45pPMLyaZXV7HLvnXcHz9+hPdE6K9vJ81NZvGko3JY0YYmw5yhY5R+BvZrZX
         zXfYg5G8+JFgjvQg0Zis2R2FFY4nPH7LMrWS7LYKYLLTKie017CStQdA0rNMhXzBjih2
         8dcZJrbyqL8Ju8IVLAADfKBVluZgrkuTrz9aeuP0A5jZqMcQL+IifRHWL5x14MSQ83b0
         ktjg==
X-Gm-Message-State: AO0yUKWoodc6ZuryYMdedjJpF88UoOI8voub17hjS9MJoWXsyQReqk2S
	SLA28VPEmlZ4UeM2WI8t9rE=
X-Google-Smtp-Source: AK7set9TgXi4XHJUWaDV/8TsTUYmyeTkMiwiPoODzO+yO5pUgrzeWwxA555ocT8N3LcxNIfdR/bH+Q==
X-Received: by 2002:aca:2b0a:0:b0:386:d4f7:6791 with SMTP id i10-20020aca2b0a000000b00386d4f76791mr8510594oik.37.1680101388925;
        Wed, 29 Mar 2023 07:49:48 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id e62-20020acab541000000b0038694b7dc09sm4621956oif.55.2023.03.29.07.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:49:48 -0700 (PDT)
Message-ID: <64a4a0fe-d364-4cd0-e2e5-8e7cfd782ee6@gmail.com>
Date: Wed, 29 Mar 2023 11:49:44 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/6] rust: error: Add Error::to_ptr()
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
 <20230224-rust-error-v2-2-3900319812da@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230224-rust-error-v2-2-3900319812da@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/23 09:04, Asahi Lina wrote:
> [...]
> 
> +
> +    /// Returns the error encoded as a pointer.
> +    #[allow(dead_code)]
> +    pub(crate) fn to_ptr<T>(self) -> *mut T {
> +        // SAFETY: Valid as long as self.0 is a valid error
> +        unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
> +    }
>  }
>  
>  impl From<AllocError> for Error {
> 

Reviewed-by: Martin Rodriguez Reboredo
