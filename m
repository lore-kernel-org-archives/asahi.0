Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3867C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 10:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 26A643FB17;
	Tue, 14 Feb 2023 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1676369609; bh=9ARKBS2BLb3SQDMqYwXHHJ/ad4zlSKBNm78PMBM76Z4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=YEfRnqpO2v1Li81PVVndaPkc2kk/nhlZGTTUz9eyR9SLmv2GTp7pEqdfthpLTY+1z
	 hGdSy/RpQvQmWhL0lQJc9cANdB0yS6mOhwQ/bhZEDjZfdbgvQIYVovcn+SYrlZywgZ
	 iXNa2waeIBA0z3MMT3izvM+DWFFx9FqxdlwMr2j498HWWLUmGkS1Xetd3qrDdTmzSc
	 Z1vwOYkoFSw3g4DZBaMmiXmycEVpjusQ9Gxlydx3NOrelAU+QM2zXB5Pm3oD4AuvXK
	 +FBJKmHNajT4rmqh7oWmsTVQUG1XRw9GNqGy2W6MEpuzF8GjM2Qq/Pjt9tG1GbuD+Q
	 dAcstv8Fa4ljQ==
Message-ID: <e1672fff-8a46-1fe7-9873-031eaa7c8cf1@marcan.st>
Date: Tue, 14 Feb 2023 19:13:23 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-1-cb5442d1c229@jannau.net>
 <3287867a-456c-ddc3-adbf-90001950c926@linaro.org>
 <0a33fa04-039f-9a7e-f2a3-2a1a6abc98d4@marcan.st>
 <5ff55f1c-8f02-abec-2320-c2e0b7db8904@linaro.org>
 <391ae107-8c10-b14e-c1ad-0fac74951432@marcan.st>
 <af7fb166-64e3-6fcd-c270-6dd53bbe96c0@linaro.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 01/17] dt-bindings: power: apple,pmgr-pwrstate: Add t8112
 compatible
In-Reply-To: <af7fb166-64e3-6fcd-c270-6dd53bbe96c0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 18.39, Krzysztof Kozlowski wrote:
> On 14/02/2023 09:43, Hector Martin wrote:
>> On 14/02/2023 16.50, Krzysztof Kozlowski wrote:
>>> On 14/02/2023 03:24, Hector Martin wrote:
>>>> On 13/02/2023 20.09, Krzysztof Kozlowski wrote:
>>>>> On 12/02/2023 16:41, Janne Grunau wrote:
>>>>>> From: Hector Martin <marcan@marcan.st>
>>>>>>
>>>>>> Add the apple,t8112-pmgr-pwrstate compatible for the Apple M2 SoC.
>>>>>>
>>>>>> This goes after t8103. The sort order logic here is having SoC numeric
>>>>>> code families in release order, and SoCs within each family in release
>>>>>> order:
>>>>>>
>>>>>> - t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
>>>>>>   - t8103 (Apple H13G/M1)
>>>>>>   - t8112 (Apple H14G/M2)
>>>>>> - t6xxx (Apple HxxJ series, "desktop" chips)
>>>>>>   - t6000 (Apple H13J(S)/M1 Pro)
>>>>>>   - t6001 (Apple H13J(C)/M1 Max)
>>>>>>   - t6002 (Apple H13J(D)/M1 Ultra)
>>>>>>
>>>>>> Note that t600[0-2] share the t6000 compatible where the hardware is
>>>>>> 100% compatible, which is usually the case in this highly related set
>>>>>> of SoCs.
>>>>>>
>>>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>>>>>
>>>>>
>>>>> Missing SoB.
>>>>>
>>>>
>>>> I'd rather get an r-b, since this is going back into my tree ;)
>>>
>>> Please follow Linux process which requires SoB chain.
>>
>> A SoB is not an r-b. I do not upstream patches that are unreviewed. I
>> wrote the patch. Someone needs to review it.
>>
>> The extra SoB is redundant because this is going back into my tree, I
>> wrote it, and I will be the committer when I apply it. It's a one-liner
>> patch. I know what I wrote. Sure we could record Janne's SoB as a
>> technicality, but it feels silly. What matters more is that the patch
>> gets reviewed, not that on a patch series technicality it ended up being
>> Janne who sent it to the list. I could just pull the patch from my own
>> branch and then it didn't go through Janne so it doesn't need his SoB.
>> But it does need someone's review (because I absolutely refuse to merge
>> my own patches without review, although not every maintainer has that
>> policy unfortunately, which means there's lots of unreviewed code in the
>> kernel).
>>
>> Please. Let's cut down on the silliness. Please. We're trying to get
>> stuff done here. I'm tired of having to explain every little thing over
>> and over and over again. I really am.
> 
> Listen, I have no clue whether Janne changed the patch or not. 

I do, which is why I asked for an r-b and not an SoB.

> She might
> have rebased it or not. 

The patch is identical to what is in my asahi tree already.

> The chain expects that anyone touching the patch
> must leave SoB.

And clearly it wasn't touched here.

> I am not providing my reviewes for patches breaking the
> process we have clearly described.

Good thing we don't need your review for simple compatible additions then!

>  I also do not see any problem in
> following the process we have - adding SoB whenever you play with a
> patch and send it. Entire discussion is silly indeed, instead of just
> following the process.

Or you could just stop nitpicking and doubling down on things that don't
even concern you, since it is *my* tree and *my* job to worry about the
signoffs being kosher, not yours, as *I* am upstream in the submission
path and you are not.

- Hector
