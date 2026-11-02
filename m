Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638700;
	b=UTr62xyMYCOUKj4m01X/dxjDgHLZKBgad27a8VhshM1XH1qAvHNameBkaA7tH+GqzWCN
	 sziY2yWCgRfrK9g5FdKBbg/8fI2WNwgg4CjsniE08K3/ntjr6uBNFgDaRc66R9wZ9J85z
	 167jT3inrJPn5SBMsQ/pcM6NfL/ugLeOFh6IxYZ+QmoOaWw4B/1Hj/1TswKUu9NnQ96bc
	 wWUjaDx7+iZdlHWDUJqNpEscMDP6ItY40MWAPUjkevH7qXthJ9jHaZ23I0yj0Qvn/koPD
	 qJs/jz7AI2qjAIUVqrLeKtvu0CZHUETsK8I6Z0e5E3mbtln80sXd5jGbZhjlwLh+WWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638700;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
	b=OMdFhwMm4My7ptPXUsjcH4E/BwswxGTPWUdtV74Tvoi+ZXbDJxPCInUgV8+yh4xVnuGo
	 K4cJwzG/WWR4K6T92DYqKBRW1AQ8uWzvpGsaaxGW2HXyqdSJLmhDrj78PtdYEV/zc+KOw
	 O+rhiStDNwmnJb5sjNzsjdMCA05QW7oc/6rute4GmMzO5WjASxr/dvhEYtTby1udN6enu
	 /SYqxZbH3gO19Bevu+nhg+oaTIklFy4gGmai2Cn4eK1wAcnVp47gT/zCUD+ml7HUx0K7m
	 3b9XwLh/8Kv/3zfhxO9xItY6n8qEimjxSJlY8qbVkHBI4S9Wn+FK+NJwW7ySG2YHNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUPcn2cL;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968B6074A48
	for <asahi@lists.linux.dev>; Mon,  2 Nov 2026 16:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8968B6074A48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUPcn2cL
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1530302a91.0
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 08:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638699; x=1794243499;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
        b=dgIJbYI0rPVAuKSiCOnpLgOp2No1wEMZ3sRpvfBHwhQjISZQevvCl8XxZWRUhc14p1
         +mLrpExqw14vT3n33BVPqvhQwUhQ084d8GIsScN5mOlNeRC6Zy4F5s2Fxwlj9zmMRkll
         v4ey7Ke9ed7U5GoCRxv9kH8Vd0c5YeK48DrWzdLsZC4a2v9Og4RY6cYNcIkB+gdIUPdY
         2aTFD0dD/GmP1q6cjP8N8mMriAeIgi+uTh2EqrYsGrowVUT7NwDn3EamDtTh0JC8NuKw
         0cPHVgGIUvy6kaQdRgOmDSmLRvMmy8J/qx7G+IpzXdOTKtu/aT4cFF4YxYhmIJfq4Fdp
         YzHw==
X-Forwarded-Encrypted: i=1; AKwUvBx0yYcckR/dN4hl1sozXtCEDfNTOAc0cAD2hO3iJw29m0uwfL+Y++RnsydsE/zTQXS5y1xQYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8TKp25e4ZQAFaWiu7IWTWU7YALoemWx7X8gMxvXWt6Oqf1q0NP
	MhrelNhhgCUlxNNdUvm/RfTgYk6oiUtcGG6CpP5OvjC4g8ePw7l9a0OHaJUV2bjHtiZHBoEZJmX
	4ObUqoCf7oYaTV6XFTCREg8uY3KiJytkfYiACf5xx61V/tHf1CQvTdxGsonVLoBT0FGQep1sQRj
	wC5SyCSSK4YBB9imphihxPxY4zuwTff4W3bIcO5brIY+kOg8GCXulky2IGn0oFksEZ9tt5eVjym
	6Ul5HdrqgELZof+
X-Gm-Gg: AYBFou2u9faNqSePuydJA0iMMrapdHYgO7t7HRTZj6WV7hvbgTTwiBBkKhQLj5wNnbD
	nclkFNV6v2sKRd2dPWBmNPcGBNVYYp946hG6lk7132uEWzjJ3FnqxmukeUNNVsJVEUOCfMJOJUW
	tsxfTrIJDankL1eWjL0LG/HJFxtpXi0WCBcw2B0pCdZ9qCwz5d4fVJVRzStQBhtuEueiafd4UfF
	VN2IMXIHa37fzE0nFE64/RvlexLMDLNvj3Rw9jHSZS4gKR6ONPW4HQHPwbkp3BoiJC9q+sEWE+J
	mxvFE8vBf2mPkdRZ+IjAmGLBquJkabXzTrxJ+zH86k5f6Eu76ae+BZE7oJwaZxJ0fGhSFGNpPZX
	70fivU9yuZNw68X2RJw1FLRldbUi4x4aFms80K9SdqqSkMNZRR3c22YIk96izSVtwdG7FnNPQMd
	u7n1rjss9ucSnM2gIiS0o1eQbBXu0PCRqslW4ZNPw=
X-Received: by 2002:a17:90b:4a02:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3ae89821660mr7749858a91.57.1793638698719;
        Mon, 02 Nov 2026 08:58:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae845e849bsm8798398a91.7.2026.11.02.08.58.18
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-843cf077bf7so4403446a34.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793638697; x=1794243497; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIqsitZcMi7h2QQHA4zZ281+QxpG2+lZy3zu6UwkhTg=;
        b=MUPcn2cL5J7sdLSB0Lzf05PZlRn6qg2zMBwunHI0VZCYOybZPjh509eZajv0/YeMRY
         KJgttDmlsBuStsH3yit3hjXVTmorzVPPew+vELwuOpevglRKjnFYAdHUjvZmRJTiYJwL
         AmgQcd3YJ7Ia8ZLZfTHWhsEJiKcW75ZGbRzoo=
X-Forwarded-Encrypted: i=1; AKwUvBxlG4FXmq0NmZ8ARrJBj2yrn52QvqTfn8A2W2UxI0Yj59LdAVHVCuIxsknw07Qii25l0eNSgw==@lists.linux.dev
X-Received: by 2002:a05:6830:2e04:b0:84b:c230:c2c1 with SMTP id 46e09a7af769-85d36400d05mr10579872a34.18.1793638697457;
        Mon, 02 Nov 2026 08:58:17 -0800 (PST)
X-Received: by 2002:a05:6830:2e04:b0:84b:c230:c2c1 with SMTP id 46e09a7af769-85d36400d05mr10579847a34.18.1793638696985;
        Mon, 02 Nov 2026 08:58:16 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9955316a34.10.2026.11.02.08.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:16 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Neal Gompa <neal@gompa.dev>, <michael.reeves077@gmail.com>
CC: "Pieter-Paul Giesberts" <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>, Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, <linux-kernel@vger.kernel.org>, Hante Meuleman <meuleman@broadcom.com>, <linux-hardening@vger.kernel.org>
Date: Mon, 02 Nov 2026 17:58:11 +0100
Message-ID: <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 2 november 2026 01:43:07 schreef Neal Gompa <neal@gompa.dev>:

> On Fri, Sep 25, 2026 at 9:49 AM Michael Reeves via B4 Relay
> <devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>>
>> The Broadcom BCM4388 chipset requires new PCIe initialization and
>> firmware interfaces. Add support for these interfaces to brcmfmac to
>> enable basic station operation.
>>
>> This series adds:
>> - Signed firmware loading and mailbox transport
>> - Fixes for chip identification and firmware capability matching
>> - Versioned scan and join requests, and extended PMK payloads
>> - Updated event mask handling
>>
>> These changes include work by Hector Martin and Daniel Berlin from Asahi
>> Linux, refactored where needed for upstream inclusion.
>>
>> The series provides basic station support only. 6 GHz support is planned
>> for a follow-up patchset after this lands. The driver retains legacy
>> interfaces for older firmware.
>>
>> Tested on an Apple M3 MacBook Air (J613):
>> - Device boot and network scanning
>> - 5 GHz WPA2-PSK association and DHCP
>> - Bidirectional TCP traffic
>>
>> Testing required separate Apple PCIe and devicetree patches, as well as
>> Janne Grunau's port-authorization fix [1].
>>
>> [1] 
>> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
>>
>> ---
>> Daniel Berlin (1):
>> wifi: brcmfmac: Support versioned scan parameter layouts
>>
>> Hector Martin (6):
>> wifi: brcmfmac: Support newer PCIe core startup and interrupts
>> wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
>> wifi: brcmfmac: Load signed PCIe firmware images
>> wifi: brcmfmac: Accept newer BSS information versions
>> wifi: brcmfmac: Support versioned join requests
>> wifi: brcmfmac: Add BCM4388 support
>>
>> Michael Reeves (6):
>> wifi: brcmfmac: pcie: Report the detected chip ID to the bus
>> wifi: brcmfmac: Match complete firmware capability names
>> wifi: brcmfmac: Fall back to RSSI-only default join preferences
>> wifi: brcmfmac: Use event_msgs_ext for event masks
>> wifi: brcmfmac: Handle larger firmware band lists
>> wifi: brcmfmac: Handle extended PMK command payloads
>>
>> .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>> .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
>> .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++-------
>> .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>> .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>> .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
>> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
>> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
>> .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++++++----
>> .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++
>> .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>> .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
>> .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>> 19 files changed, 1593 insertions(+), 339 deletions(-)
>> ---
>> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
>> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
>
> Works for me and looks good.

So what does "Works for me" mean here. Did you verify it is working on some 
hardware you have? If so, please share the info.

Regards,
Arend


