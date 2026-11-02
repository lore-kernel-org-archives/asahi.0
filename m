Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612742;
	b=FYof6jceNGcV9OGlJXg/DGgoRl09751MnsiXrJdhvKy6fcHyfWQc4Lc1GwBGrKyDDS6u
	 axN/59WtqFocqQDv8kERiQP2u9z11s6WNl2Ubr2NMuBHCpzBa9HG6tn2FDAqmAjU7i586
	 HOfb11b1dTpRmBVVPRIBxEf+ekzKWF6IR8azWTs1qVmqkb0h0/jVppKkFys96hVfTcuYP
	 +Djg9YCDS31TJ4EiF/IfShb678xo/iwS5FpmJmfevhFadCYgSFoGT/4IV/CUql0NgK63b
	 XaJdRdZNv4TJDQ5KjYgr2qGcuZWGehkCWAfxjgXA3bJOyQUlss8HWM7byW0BNpwkPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
	b=gGOvlNHhv/mn7Th1CRc+1w+dCTWxfMAYMF3cAiG8StHrB4YvYNs3srkHK4SFVfrQeq31
	 3rAnqU18fQHTwTH4e7uBYQtQa+2IGmsbjFKCsCRjKu7TrSk1J4t9cIWf8hBqYacLi2E2v
	 nSyl5SdMlnKLWjlAUhPkSohq/t5jRlw5o7g7xCRvMJsDbeV8rB3jwtc+eRyUyzaSZm0fA
	 87HS2aVkgHkSolq1iWZQWdynPR+7y2IUAeCziGwkF2zMjkt4MYGLPquKXAHD8aBWbd24N
	 GXo+UhS4Lg3Hkhmn3jVx2gMMUVgzaciP1Qk9R5aNpQKV0MuWSPFIbRWbQVsb8MY2bTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cju7SKOV;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C6606A326
	for <asahi@lists.linux.dev>; Mon,  2 Nov 2026 09:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cju7SKOV
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4c9abc1824so423301266b.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612740; x=1794217540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=cju7SKOVz1G8+q1xOVXdZsEO/HKQ5Rr3RZk+JE8zBpuLTwtDX9XQPUSbaqUc+ta+s+
         CVL5EkrfbeQqXC53c/VXy1j4Z2KZWhJdAbxoBVRG3RCM3V9+YtUVdyn0orDljvNWwlhl
         4l/vZWgnwh6uS+9un5I5+6obkdLKk59gdNWHduo/YXfu1HPweb3ZMyVre/QqHKog9G3D
         Cp3QHzzl7EisUi9Jb6rMYvWZ3vQt96WAVx+PAHc+FEfZ8l4z9FhnFevh2zLAJ9chPKHH
         it47E+UwbsMIVwEa4JejEck97DE/L3MeAArCdACrJNqDa3LiPOhaLtcLPjEErVEvH14N
         OTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612740; x=1794217540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=GJlTRWgCZLxpvKz4LWPV0agHSVIupkRwimbszbCNKIzWtt8DDYEQH/3bnxY7iMm65h
         y2Nj3dOyt/zPDW5JcOtuS6XTrno7OcyyPV87fN5UxHtDijZfbqTMT2YvR5f2ZnrYhtdV
         dC5kVOWNEkumgDi/m6W68M0DEjlKZ7K+WN6ewDAimUI2pq5mdm80EYtLMOADXy55Wexx
         hNL0OaZ8u38khjBOmDYHFGB7TX4INLT6MoupIzidbwRcISLSHkfsu8uOxiRUJzZVkAJ2
         7ojI0WDev+KYone10c1dDLVS1fqca+EPx6+qUuspUJ6vv5ESIdr3DSTi2gZA3oQtevIM
         JESw==
X-Forwarded-Encrypted: i=1; AKwUvBwqtFiZU+iv/JaBjZyMCZ9af43r68UUHmFaCRoyeA/GLjVnjlVmilT40OOwjJhfT4vwZPBhYg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJPqscYt0vIdNX4ne7GCsopDRxmKxm4Y/RJQg6VSma+kaGaD8tF
	y+9+96u3EGw16dApsjxfFhBPx2FIOxtkgigLy8/hJhK+QzfINJ+Y5ryh
X-Gm-Gg: AYBFou0sOhEBDyoajgMRk8EPRYNabA8Q7kj48vAid6muB6dyhqvedsddLBk5JVCAGvw
	Ux1AUKKdfGHfUJCTOKHtUOOPZ9npP32kbCmnnSy4WHk+WJx/mHDIAmjSeEJxMnJRBOerUoY0I3L
	NANwLgctJ3Fp7dznayC4NcXUcf9UoAsIX17ZVZHRjGh/OySHhJ1BTLqcnGwTrjseS4sNtwu7ySY
	tEAcgKTMDwN9/QgRI0xstRVSyQCWx7dgUQB4CNGb6vqugkH7NeJL8TSdqFWAfyAmf9zETzkvc4E
	cuxNf1A4TWO824Tp5YrtfzHMs/yzYcJjXqIf6E3393LhnbioQQC3sKBbgL3s5lSg+NL053eiNJp
	J/323g2hoDTeZ5CaV0B7xcERUMf9IoNcPnNsOlLiwvbtAk+smaBhwUYyEd3imBGSYrU5EwUeCVa
	biJULgOcsnXZbYO6j4EXLXUwcQxbWer3vTgZBYjJjwyhjzsBl0hqwGGdHVK1Kv8YmVBYZS/gI85
	me5k+4+S2kIZ5U/bIC1/SjF6h6udiB9XcYwVl6L8vXw8D4m87zs1l3Gs5zYFWqpHyXd9p/D3DqC
	412dW7xatl+Mfs8KyRaidc3OR2sM2RZye2uFxoCNY34vAGC+VvC9DLEqEUbPZXA1kLzcmD6MYOF
	JwrCi4Vn1v7jKNyRMi52dPC+6V/7orNsMSyIB1bohUQ5+
X-Received: by 2002:a17:907:6e93:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c4ca7aac4e2mr783350066b.31.1793612740250;
        Mon, 02 Nov 2026 01:45:40 -0800 (PST)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm369796766b.4.2026.11.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:45:39 -0800 (PST)
Message-ID: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 10:45:38 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Jacob Procee <sn125164@gmail.com>
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Language: en-US
In-Reply-To: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 08:35, Jacob Procee wrote:
> Thanks for the ack and the extra background info. I would love to take a
> look at a race-free version of admac_cyclic_read_residue() as a separate
> follow-up patch; v2 of this fix follows shortly.
Hello Martin,

I looked into this using REG_DESC_RING. It only contains descriptors
that the hardware hasn't fetched yet, and its read slot is effectively
the hardware's fetch pointer.

Unfortunately, it isn't updated atomically with the residue reload
either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
DESC_RING still showed the old state even though the residue had already
reloaded. In another case, DESC_RING had advanced while the residue was
still 0 and no report had been posted. So I don't see a way to get a
consistent, retry-free read from these registers.

One could make the retry check more comprehensive by using three
counters: outstanding = queued + playing + reported, with playing being
1 unless the residue is 0. This would also catch the reverse ordering,
where the report is posted after the descriptor is loaded, which the v2
check doesn't cover.

However, I left the debug module running overnight (10.65 h, with music
playing through the speakers), and never observed that reverse ordering.
There were no XRuns or backward steps. The speaker channel had 96.6 M
reads and 15,483 boundary hits; the second channel had 29.3 M reads and
86 hits.

All 1,498 snapshots that failed the three-counter check were explained
by read skew: 822 where DESC_RING was read before the fetch while the
residue was already full, and 676 where it was read after the fetch
while the residue was still 0. The positions returned to ALSA never
stepped backwards.

Given that the more complicated check would only handle a case I haven't
observed, I'd prefer to stick with the simpler v2 retry.

Unless you know something about the hardware ordering that these traces
wouldn't show, I'd prefer to stick with the simpler v2 retry.

Kind regards,
Jacob
