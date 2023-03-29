Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F463D2
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 18:16:36 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so5502151otd.3
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680113795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=somFh1uhW0pZ9Km2n8zQjRO2r+wUA8O/Rj4+D8ShWV0=;
        b=HIhTQSyU7RjD/NNa0Sgd3HMaFspLoot1hSfelzXW3lLXeb+gghjEUS9R7gtM+cx+C0
         cPMUc4+8CAR8JrrtRkh4v2Czk5DS3a9qdb8spGAhvqBrQULEPgAQ0gWTnExC1/+nybxt
         snjL11AAbXxFxf5Z1RsIO8FLmnQYcyXQr5wib8KJDiLbZJGZDvATIl9CbmGlP4q6vFtL
         aoBD8Ubz8NGFMYsNJAhGnvpKFR/E43cuCMbSGJCyXJxkIrMA8EIYVxj5vx/S+52GEPaG
         yDtR+kS+9CiGeD1lxudgIcaiTZS6Y2XLh+VWyWnik3jHjwFJeKmQ3ZsxPGLdclICqsq7
         ckUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680113795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=somFh1uhW0pZ9Km2n8zQjRO2r+wUA8O/Rj4+D8ShWV0=;
        b=eW2Je1iOfYr+TL073T/fRqQqzYWb+AkTJ0wD1xfJFdsII/GIU/Um4IX/DPRDWq2QCJ
         PUfZ4pTUK/UAXciI/fAug23EXsSg5AxFVFg4X5+AmYVnDWlr6A8rFOWTyVzeOwQKTH1P
         5QFkUMe/zC2UI/y+CKxIN43YjvVvojJ1DXhhRVocNpUbEEr9ElkfZsHWI3tDXT2e9IYw
         /W3PH1xYcJqN6chW1D+WGnK2W87cVWnpMCPsvqW7wATUedP1Qm2Uf+Y3f3E52Ace4CZq
         Cu3OQ6HCXHqOWsdCIaJzJ98ddMBLRdNcfiFwVlzYixs36K100zTSW+7rNq1bov+aNwWj
         /bJw==
X-Gm-Message-State: AAQBX9eZFr6Qy+hv3Hc4GjH/HHWFLStiBpbMAKKIpVU7jI3Mr8MpGB+k
	h/JENt3prFtrjrp5IgWpghU=
X-Google-Smtp-Source: AK7set9t1ky4C84DCB0Oa9W5iSm8eMk1sho1/wGcP0jut+StvjNl5/Wwed9jFJUtSLvjILKMX92JiQ==
X-Received: by 2002:a9d:7e96:0:b0:69d:d4f4:733d with SMTP id m22-20020a9d7e96000000b0069dd4f4733dmr9367901otp.4.1680113795235;
        Wed, 29 Mar 2023 11:16:35 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id a12-20020a056830008c00b006a11de6cd02sm5663072oto.34.2023.03.29.11.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 11:16:34 -0700 (PDT)
Message-ID: <2a10a97f-70ba-5216-a527-067deda6a94e@gmail.com>
Date: Wed, 29 Mar 2023 15:16:30 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/6] rust: error: Rename to_kernel_errno() ->
 to_errno()
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-1-3900319812da@asahilina.net>
 <0849f870-2d95-8c3a-c7dc-2b18dcee4c65@gmail.com>
 <CANiq72ko9tY4dsK9Srte2oYQp8G=PMyLDTOR33-yNTVXmfyzeA@mail.gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CANiq72ko9tY4dsK9Srte2oYQp8G=PMyLDTOR33-yNTVXmfyzeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/29/23 12:04, Miguel Ojeda wrote:
> On Wed, Mar 29, 2023 at 4:47 PM Martin Rodriguez Reboredo
> <yakoyoku@gmail.com> wrote:
>>
>> Reviewed-by: Martin Rodriguez Reboredo
> 
> These (in the different patches) are supposed to have
> <yakoyoku@gmail.com> email when I take them, right? (no need to resend
> them)
> 
> Cheers,
> Miguel

Ah, yes, they were supposed to have my email with it. I wasn't that
livened up when I sent them.

Thanks
-> Martin
