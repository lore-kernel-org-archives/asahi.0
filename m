Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036195;
	b=CNOla3NerMdvFls04OeibF6padKS5cVfzXq6mVdvDlvpOYSCuf6ko34DBpUK+dvWZtFk
	 rROwmwikQyuPKL1JKIN+TArph3niU1zRGr2/ssaqdpPsBOC2VIwvakfLZNr4cQ8A+Qoa1
	 v9AUvaAedXP89TSjYrDvDOSClOJRSIWfUm9aw/ZnD6Gfr5jCBDkO7sqd+DXZFXpjGSJv2
	 AI3zjuR1ZZUqHMSRURdMMefqH1GDck7pMxcIVSt1m0xS5lUpQGZ4UxmdEizsMHdi4J8VJ
	 9RZCt4fjQ0OOI3yicZdPeEhUno6ukl3cBxUnRPE47eMXTufctFTiv7f1brWk2i3ijyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036195;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:CC:Date:
	 Message-ID:In-Reply-To:References:User-Agent:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
	b=VfZn86118i+CGWOKdHO75L3o9RihMO/WKbI+rO2x7yOuNOBjlCjC7PiJjr0ueA+elejx
	 9LwtMlTlzkLyp8tLBEv0EzKnsc70vBB4oy7S7zUTEZSdS4rwv2zJKtBwXQBVeZnZcrrOj
	 menXQhfhaFewudqShgp3rHkpxzHL8PxW/TAXUUmh13zYN0u5Gs9m1mo1rIHq6lZ3Ej4/V
	 SnMpSyEAzhvECwD5msUSbLa/FmojvXYIkn4O9t+A7tTrJcNDqcpBGhyMjmQ6VcYgeR0A+
	 I2BcCScjRtLnTAdeUzSBB173JSr6swhrvuzewQdQ8ab+6oJNmK3xXLsy7ik+GZH9/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LUa+VEo+;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3F606A326
	for <asahi@lists.linux.dev>; Sat,  7 Nov 2026 07:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LUa+VEo+
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so848052a91.1
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 23:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036195; x=1794640995;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=kKAjH9mQ04/a1GovPzr/CIQsy+ELCILd6I1XJn22n9GoLLHeUQcSGLru2YvzWnhGsh
         eetXzTNR7fyUeT23otp2d7ObuxoLFyphok8Hi1J3KfEsEonJAoMzrUvFl4ucCCYhgq4s
         4xrYaaDFiItGjys2tqPpCTlwuJTsG+ZqCMbBt5dPyFKLS442Qyq4d0VNl0lddES+2Jn7
         f+/oyws/aM92EHot6XKWKCsJakGFFHJo9jj41cJn0YeNqNmfnXXFOOpTXkNj0v2MqjNm
         b8PCy3yB5hlTe/C8A4iIyeWOos8HyOQCwN9u/Za+2WXY0TrireeHD2l29W4gp225VgUB
         Ibng==
X-Gm-Message-State: APuU4Z8WR6JTcS1WwFyCdf3TBgz2kRltlkJo+DKI6RLSRvfKeTDksQby
	bpSasFs2K20C3cfQ6ZzmM1qSAzRWGawLsiD49J/afhuGHDSG1cVGjWNjJKkfkaak3HXlbVU2772
	2m3DuyaCcdM/8s/P/+pmvG84zeG8YJ4O7vRxQGNfTUSW1z+/SB2Lk4TfUETQ16PXMzImWWUVRPu
	TQwokhXNKuhnPwosRqRBR7rLXrDQuSvNPzc9TO4Y/LsiIH5E2tC7NGfch8MwVGSd0T7q6pTV6sv
	KxRueS1ns5iZHrv
X-Gm-Gg: AYBFou3D70qX+HzDuam38dCGGXYSW2DqphJNUxnEAVWTqa99wOkOhJnRe3Y/WOMC0G1
	6jSfIGrQ5p7TPn8L05Im8t93iufdjW4tDaPnqrYeze/ndD4JlEMjouJ9dGROLRiEIimxH1FLz+D
	zBP+tVNkD2TICxRqRfXhDTPlF805QAl0oByjLZB30mOx+FMnGi//ExSbJWvd8v70TBZObf2Yvm0
	RlLAkISfIsI8L19GrjhBY7z1gK+FCwtJvwmFVyfWCXpyGGBAlJuzZuinOfrUQ/IGRRZNpgcFCnU
	Cbryfu20iLGmUODiWzOjCg8O6OXs2ZVYbi34gimc8eghHvOYknMw8ZXiBpCVecWiyS3d5ogVAya
	Y8kUe3QoFBQ/FMFZ7jdQGED2D+pAJIH8nvUMOnKiBfFQa2BcM0t4F8T6SUZq01QcTt9Sj2ESaoG
	eVAlM+VZfLG9WTyBllFSHiBEaS7VhfP1QNeSfg6CI=
X-Received: by 2002:a17:90b:510f:b0:3b0:ce1d:3398 with SMTP id 98e67ed59e1d1-3b0db69ee22mr4833799a91.18.1794036194582;
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1058d4f27sm1163847a91.3.2026.11.06.23.23.14
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c4d1684d1b3so131861566b.1
        for <asahi@lists.linux.dev>; Fri, 06 Nov 2026 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794036192; x=1794640992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=LUa+VEo+EJSOSkrieZJlmcmp2l3PWr6JdSPqfow08sjFa4PH028+pvmtWSjfI5Cgcz
         ZSyS94OICnrqZtlKCCepVc7lIDUdz2OtZoiWXha5J4trJFZa5rQ96ZvjqvNIg8aW4erA
         Z+BgilDH+hxP9ihSAIAN1UfrFPuzlrsAfPiOQ=
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369014066b.43.1794036192738;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369012066b.43.1794036192265;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569fa54sm134100066b.58.2026.11.06.23.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Sat, 07 Nov 2026 08:23:10 +0100
Message-ID: <1a1b4e3cb30.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106191826.4ddb997a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
 <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <20261106191826.4ddb997a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
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

Op 6 november 2026 19:18:32 schreef André Eikmeyer <dev@deq.rocks>:

> On Fri, 06 Nov 2026 18:36:52 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>
>> Sorry, you lost me there. What is the relation between the patch in
>> this subject and D3 ack.
>
> Hi Arend,
>
> D3_INFORM and D3_ACK are mailbox messages, and 05 changes how they are
> exchanged. Without 05 brcmfmac writes D3_INFORM to the TCM mailbox
> and our cursed Apple 4377 firmware on the 9,1 doesn't read it.
>
> That is why I mentioned the D3 ACK timeout handling patch. I
> submitted that because I was sure the firmware wouldn't send it.
> But actually the transport was broken.
>
> https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/
>
> which was superseded by Sebastian's patch here:
>
> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/
>
> So probably for addressing Sebastian's issue this needs to stay
> anyways. My memory served me wrong. I just read that his device is not
> an Apple product, but his patch incidentally worked around the same
> problem. Sorry if i was causing unneccessary noise.

No problem. Thanks for helping me unclutter my head.

Regards,
Arend
>


