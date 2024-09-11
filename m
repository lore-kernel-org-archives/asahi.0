Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049F5187324
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055031; cv=none; b=UfygfPRy5gYqwrGr6pccFUU3k7Pc0RAW6i/b3IxjzfWvl71cDpeztBZO6jysJwnhySP8y/iOyiLPWUuIJlmxs5qBqikplinCIY+R+PzqXWQyUeJrvBzr0I9/yfM9Oyk6dZ2KuaOQI8jTADR9+YrsCaDRXst9g8+PIRRHaciogVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055031; c=relaxed/simple;
	bh=9hiabN1M+tFNIMHDE9LStpgFSYodQc7eDrfAIyTkOt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJLgmFuvU2o23VGlqnE5gXBlOBY/hHJjmDo26CizxrUXI7MACfurLnsvJ3k0w3t5HT+flbUhpuQJMZ8E7fUc3eJgZiXoW2iWKjcCRkZCI9MZtd6L3tzKQP4tfcbngDInNtbXrMs9N3PuQyWKnwR1oFeEn2qPax9qnYH/+va2lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PDQaGaYK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PDQaGaYK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so729084866b.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726055028; x=1726659828; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0836bPdfIiVhJZmRIpwdukfSHhRJerCCPsKDHVUH+Xo=;
        b=PDQaGaYKTEDqqhl2YnRjco3sEVPacssu07MkU3Jk6AXGdJXMnT1+eNRv2JLUz7JL+I
         XWz2oePZT+EWd3prQ8sNoD8DeY4Lli11PIytbgIALI9esFaU4xx0YUXol6MIja3WZ7mn
         WfFXs0QbUBQxC0yvm6QX1Pc4j12MraMSzJolmDT0uDiQqykA5BXoFpmT5ssbxexh0PC0
         8rGB+IpbPNud3LAYL9F/r1cQITUh4FJ1edXY+oFCrU02j58z1elb4YnTHlNtGoke8Aj8
         kK9pPfI912bb5eNhBJw9LnrSiyLQ/WzXf8bwpDYUmT6T6GtvMg/OI/CkPd6t+NPdJ1Lq
         Q4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726055028; x=1726659828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0836bPdfIiVhJZmRIpwdukfSHhRJerCCPsKDHVUH+Xo=;
        b=LeoYePheLLEwzVnzpVX6dVsXQHTZTntPa0Hs9zoCfPaPkVLp9WFJHUlcKqgikHHs5J
         P5XOjRy1AW2V930vGeIwPQ7yIc5yACVcjTi9whQbUkt3vutCaeffEL6qdffTC8ay1A5m
         IiPuM4J+13uqc1aSIK6oR8BRbp68YYMyp/be11M5N1LC9MGlxJkRkNthgZa6GU75M7Cl
         uzhT6TPwjc4Ecol4ui2uLnvOXkv5tbRMPAO1Qt192Cigu+q7QuQG1xsdQLJns3450+Ic
         544lZXOXnlsHFfw75GsB1XQg98YiQkoCfGgQmtKjbTbegIsMYg9Hz6ce86FN+xA9f5IY
         aeVA==
X-Forwarded-Encrypted: i=1; AJvYcCVKNF8ziku7VXYF3RubKEoVyx/PogRVfRutkckSwCBH0SWl7MXW8QVN1fr4sRa5mVsr90RJlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWbKCCT6/rJCHgHkFyymPYoxvoVzea2nB/aRI6//OFGJbj2JBi
	2AqiT08KBGSbVU7zf7a3lUgbhmCj+Kuvu5zKZ2apQuU3nPTvLzpKgEmC2mNQNYk=
X-Google-Smtp-Source: AGHT+IE06+xDqkLYzGpC/L+2NLQeM/nBC/Gy5jIkoMSaoEd70RtXRRQzFeVamgQr7aHe0PKw8Wnx3w==
X-Received: by 2002:a17:907:2d0a:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a8ffab78821mr368553266b.35.1726055027526;
        Wed, 11 Sep 2024 04:43:47 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d97sm606731866b.4.2024.09.11.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:43:47 -0700 (PDT)
Message-ID: <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
Date: Wed, 11 Sep 2024 13:43:46 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Sami Tolvanen <samitolvanen@google.com>, Miroslav Benes <mbenes@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/31/24 02:05, Sami Tolvanen wrote:
> On Fri, Aug 30, 2024 at 9:34 AM Miroslav Benes <mbenes@suse.cz> wrote:
>>
>> yes, this is one of the approaches we use in SLES. We add kabi paddings
>> to some structures in advance (see [1] as a random example) and then use
>> it later if needed.
>>
>> It is not the only approach. Much more often we do not have a padding and
>> use alignment holes ([5]), addition of a new member to the end of a
>> structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined
>> structure).
> 
> Thanks for bringing this up! Sounds like we're also going to need a
> way to completely exclude specific fields from the output then. I
> think we can use a similar union approach, but instead of instructing
> the tool to use another type, we can just indicate that the field
> should be skipped. I'll come up with a solution for v3.

It might have been mentioned previously, not sure, but one more case to
consider is handling of enum declarations. New enumerators can be
typically added without breaking ABI, e.g. 'enum E { OLD1, OLD2, NEW }'.
It would be then great to have some ability to hide them from
gendwarfksyms.

I think neither of the __kabi_reserved or __gendwarfksyms_declonly
mechanism can currently help with that.

-- 
Thanks,
Petr
