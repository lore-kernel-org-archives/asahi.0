Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A9D520
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 13:47:02 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a3efebcc24so1559901b6e.1
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689342421; x=1691934421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HD6EwZbQJu1bCBY+rcg6mXiAoH8uR23NwA33Iv9SafM=;
        b=pT1kVQ6XLLU5dt5E+AFNY9QhZuRBQIYTjp1J6S5jlO6nFuZZudojXsRjSdMSjylMAd
         gAJPOW/iRlTqdkc9XggqD53ZtMYT0mYuFAUAM/8xqFCGDYtJlGFwWp0BrdgKdjQpphLz
         Mb1XpiicBDqWgVKV2WUgc9Wz9kheJJyuN+u48GVQhxNanlycVjmAZwXs4LGt75+sLLYe
         HrMEVVTzUMDhL8xsPik+gmHICkO8sjbXy54hda1q7/0yUzfMTXYXCVba1lS7ECUHyybJ
         pKBTfsfnqzmSGza4TQaUCkLGUrHDqfCgGZDyWMjZApQ8KOlnmg74P++ZGxT3Srg1uMty
         iM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342421; x=1691934421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HD6EwZbQJu1bCBY+rcg6mXiAoH8uR23NwA33Iv9SafM=;
        b=BZPrFdm9cCx4gU3G6gGfriyH/LQ21A1JTZ7l47PWBoX+aTYFUpHbEYnxFElk2NGLkQ
         o8SUb7z2EwuC03nRo4N7liN5RBsdd9RUUJawec2GUfxXiDWcUXsXraPxGarvefqopxEL
         XmdlkvaPldVS0tgqVCghH6a2sUFhRB1/1cxhpCRdGiVlYcFZ4TaQpGgoxJZoNVmV2nd9
         +T6OFfltJE+mZGVSv1sxzlFUr3cYQQGDjchNtpSZcUahZp8H9Z39QbEAKqHzK7wPpEzk
         J00gLfMrqnS2b3Ti+EE3OKLfqiKk+19zamzCbpqvEwXw0JJSqLDQyc7kWkqDRxbrm5q4
         rvLA==
X-Gm-Message-State: ABy/qLbITTz3XyR2WxribZvx+FFxJGwciGA3bveEXlZf5sEZ4jrIDI1e
	gjHGOLRK4ddKa11BQIYPWwQ=
X-Google-Smtp-Source: APBJJlFbbN9VExbGP8hKwyPAcp1eD3AMx0mXuJb5JT/bX58FKmMu7OuwcKqRfpZi3NBQCmLvHP2opw==
X-Received: by 2002:a05:6808:573:b0:3a3:6536:dd89 with SMTP id j19-20020a056808057300b003a36536dd89mr5292957oig.49.1689342421072;
        Fri, 14 Jul 2023 06:47:01 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k11-20020a54440b000000b003a1ec14d8c6sm3834259oiw.23.2023.07.14.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:47:00 -0700 (PDT)
Message-ID: <abab244f-afdb-f646-ce82-c5296fe74ce6@gmail.com>
Date: Fri, 14 Jul 2023 10:46:56 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: Asahi Lina <lina@asahilina.net>, Alice Ryhl <aliceryhl@google.com>
Cc: alex.gaynor@gmail.com, asahi@lists.linux.dev, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 linux-kernel@vger.kernel.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
 <20230714094844.2189906-1-aliceryhl@google.com>
 <15a21f18-485d-37d8-0a5e-417702787204@asahilina.net>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <15a21f18-485d-37d8-0a5e-417702787204@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 09:21, Asahi Lina wrote:
> On 14/07/2023 18.48, Alice Ryhl wrote:
>> Asahi Lina <lina@asahilina.net> writes:
>>> Trivial implementation.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>
>> The commit message is a bit short, but the change itself looks fine.
>>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> It's so trivial I just didn't know what else to write... suggestions
> welcome (for this or next time I have a patch like this) ^^
> 
> ~~ Lina
> 

Just describe what it does, like "cast the `CStr` to an `&str` and call
`fmt::Debug::fmt` with it". I'll add my Reviewed-by, so retain it in
case it's asked to change the commit message.

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
