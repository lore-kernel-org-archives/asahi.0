Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C31DB361
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732645465; cv=none; b=d2GO99Yitl322ppeJpAMWIEPGcubLWWx6d15izFFb6UgRR/Dq42Zd/mYEiW/XBldmhaz3JIvWLUG2trm3tipALn6Bce3LmGO/OVZBUylKtSjMoPx4Cau3PpTOExonHmuz1zDDsWjRkrR4OEQzQq/u/tntOFXYM8wOT4Xs7t+5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732645465; c=relaxed/simple;
	bh=hF79OJOTF3Zhn8zXCNMfZBZW+wmNbw9AS1gO9o5YyZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5COozzgMNE46qTIelQcpG19CX/dLyn8c0dj7PVSfb+poWDyBM4r/ZupmfnjKRZ7eaIgNbgGSgr4daotMsupY4XFUe3Zyl30//W0aVyevfmAyWLw81+CBpk17xHi/uNbb3EaCud6iahHzW1QQDbj0ggAsxHL77RPi1oaaY4ayRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=DrCj3ZNg; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="DrCj3ZNg"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 056C441EA7;
	Tue, 26 Nov 2024 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732645452; bh=hF79OJOTF3Zhn8zXCNMfZBZW+wmNbw9AS1gO9o5YyZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DrCj3ZNgdTLjEa6WgNpslR3Re7kRLIDW/oSjyfdbX0rhfHJ0NMtMr7MEJE3X0qemC
	 jMGWqS8HVlaoEQ+GBcLBPC8IdI6jijrOIbFHhuMQqCp3xr5CA3v/MKisPcTbgoz62G
	 av58lvd/TZ3KUf0e2hzo3w7Ms9Xer9NcHuuf2A5yVX7hG3d42yNe/rBAHQt+NeZ7C6
	 QSNbywgdmfFTE8fhM839bRIb2gWqFdwSwkpoLrSxSLltENbqhA0LQScpQ1CHh//2xT
	 sm9B97wLh93yuzi0C6IDiR+Utp9Ny2HYms+SgANp7VHPuWEv0UIx7KspScgs8X0UBA
	 +ouOVcHInABAQ==
Message-ID: <3906a62b-3fb0-4ff7-bf0f-ae72009d3bc3@marcan.st>
Date: Wed, 27 Nov 2024 03:24:09 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
 <CAMT+MTSwCf=iwmD3t=E7T81K_d+o-5XpCxov9fk=_oUnwooA-A@mail.gmail.com>
 <e5b9ad58-ab31-4485-a2fe-d622f8e0f31b@kernel.org>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <e5b9ad58-ab31-4485-a2fe-d622f8e0f31b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024/11/27 2:20, Krzysztof Kozlowski wrote:
> On 26/11/2024 18:00, Sasha Finkelstein wrote:
>> On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - apple,j293-summit
>>>> +          - apple,j493-summit
>>>> +      - const: apple,summit
>>>
>>> Summit tells me nothing - no description, title repeats it, so I suggest
>>> using device specific compatible.
>>
>> The j293/j493 are the device-specific compatibles, those are chassis names
>> for the specific laptops the panel is present in.
> 
> This does not address my comment. Use specific compatibles as fallback,
> just like we recommend for every device. This should not be different.
> If you do not know the hardware details, using generic is even less
> appropriate.

The panel is codenamed "summit", and that tells you everything. It's a
panel sold and marketed by Apple. It is used on two devices, which are
specifically referred to as the device names "j293" and "j493". There is
no further information to be added here, the names chosen already
contain 100% of the available information and are completely and fully
specific as to what devices are involved here. There is no more specific
or appropriate compatible possible. "summit" literally comes from
Apple's own device tree compatible in the macOS world, which is
"lcd,summit". If Apple uses it as a DT compatible, then it's a good bet
it is precisely what it needs to be to identify a device. The
chassis-specific versions are something we added on top of that and
likely aren't even necessary since it's almost certainly precisely the
same exact panel in both laptops, but as you know, it's best to be
specific with DT compatibles just in case.

There is plenty of prior art for compatibles that don't look like random
product code gobbledygook (which I think is what you were expecting?),
e.g. these panels:

ti,nspire-cx-lcd-panel
ste,mcde-dsi
raspberrypi,7inch-touchscreen-panel
olimex,lcd-olinuxino
focaltech,gpt3

So yeah, the correct compatible is in fact "apple,summit". Anything else
would be making things up for no reason. The vendor has chosen to call
this panel "summit", so "summit" it is. We're not in the business of
gratuitously assigning our own product names/codes when a suitable one
already exists here.

- Hector

