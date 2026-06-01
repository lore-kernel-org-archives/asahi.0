Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F44C92
	for <asahi@lists.linux.dev>; Mon,  1 Jun 2026 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296544; cv=none; b=pxBvDuEZI7xk5a4SyPwMnzm5tnR/ruB6A+UQWRMJW+b6VtMY0EULvTR/yL2+vhS87RtOkxJgONaAg6Qoj+F2CsrwhhEiG0swqXa9OcTjvlGSdMuZy3mKWNGrV+e1MRbo+lsk5tMU+z8wBnPDHAKC9/FOVQySBr56WexcFOK5o1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296544; c=relaxed/simple;
	bh=y4/ouupBjoYRS77m3fiaKDERYhLyJZEdAdivWI66SqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRCmGq49JMlweCuZH9pQwtcPjGQgtVrAddH8OtB6Za5/4FP6qVDPCYvbtaXsaq2YiMyhMyBQ7NwbO/POBA+4QjIPBnHq6UuB80juc85YltpMKi9nGi64iwtZTZI9xtO8yWIRGRpfsL/l1jQWvCES6ciL8N/dXTMLOTt01a4nSNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu6rjTN4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu6rjTN4"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa5be9ab1aso2558371e87.1
        for <asahi@lists.linux.dev>; Sun, 31 May 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296541; x=1780901341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=gu6rjTN4pWCuTZsYyKnIVX9rDYs1yl+zmsuKbYQqQYXFzNKIKv3zs6ZzvjWMOopyeC
         6lomPK4q0jzDi/oO2/VJQnNS4dAMZWLkwuqXtiRydpGx0q0eEaZ23Uog6gZLBBh4HvMY
         ah0cKuPWXkamnCC7k/UaVHpLQA+psKlu8IZFIW66lrjOi/iAKzqAdiNcfFWcN67ERgu3
         KQ9CL/KhJYhhyqmItz/vbiiwAQg5Db+AIXLvk0OSMJGMll+FtMKnm7Kn70ftLO92OG3D
         gNpaMvHJZuvQy7lhEIOrbFKBoPqchceenyZ6HuEVNvSAJUqd6Wa1U4a/LUxWyBsWTYXx
         oKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296541; x=1780901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=TuXC2q1XqqG8NtVVpoe9hldYxuPGchQaaC+2mR+hXCINWtITxyq3DwF2XfywqLBYVw
         VqE+Fm4Bm+Qw8ExIGcroM1D/ubn6lbjenNeMK/is/n/i7sweHl/mka0oQrmhLfvNPq4l
         9NIOBYRZRQRBOuWqpSQGitKjwOWq6WbqyFq9CP9oxmQbvxa7e2vE320WyjS75STX+kxd
         jyABXVHpI+TdaII28o542YR2hhcDAV0luqge7kYQ6+MpfSouN1pds1HGTmSzYxaDsbg3
         OCGMjiOAgTDUm2xs4qKhldGVipNFccmJc6HcEDlI02wK0MgKHFJRyEBxAu7CoRSaZOOd
         Scpw==
X-Forwarded-Encrypted: i=1; AFNElJ/QPh8JY8EVgrtFAnoHXUcHQqpe+VYTcCJdt12Z+1v/ekhVX9YMDE2pzPmDsiKbhSbbsnwF5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Sur4KDQrnWCXY6oe0vYbZzgcx74glzC/LFFXqLozUhCzA/jk
	F0jSi35Lem4+2v1fegMf1ojSV6p9qcxKxGGd/pVJItMhZlAMmzXZ/9/B
X-Gm-Gg: Acq92OFrAwgZSHZ1AhhCN5rg14ka3cJIdvFqB8vtehO/BOI1MGm77q1rRu6vTx+kc1E
	MW0V8vSuJvpGC5friLcZw4JfI6xZN00ljcEffLwossXoeiSQMqs1h+lGUmmAu5nidxe/k1s9Glt
	f8RDJUrrQ1wmIi5PyOyH183DY4Uy5+pWKKAOb3n/8dpIbTXMMbmFv5PTkhD+NLOfnn6kUV3dosW
	uReY8F1RCi0FF27foZWPap15Ma2IOr9/fr8mknVI7+xsrnqO2hTYWy7LKTNabco4HeFnFr/r6Lp
	v+IC4Q3lmtklXrhiMcVPa/YZl9/gak+yjbR53WiGrAM+l/yYkpikTNezMk1StGCXjxecnHHBGF7
	CLhw0eywecPpI5u07F66j20eMfQOggyQNlrjhdPGvQEDh8cSxPVo+9lTojYp7BGZdGnXTjWudmz
	0DmUULEV9tehc6b1OpwX7yqMIIfbHoQ0mfuY4SZDdv8/Qf0qB0LYyGG+qrMb73ypl7jVdXMz76/
	aDVPFkrMKugke3xuaQ=
X-Received: by 2002:a05:6512:2306:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aa60a32f56mr3289885e87.32.1780296540285;
        Sun, 31 May 2026 23:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793e24sm1898970e87.73.2026.05.31.23.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:48:59 -0700 (PDT)
Message-ID: <b509c623-a47f-4216-9202-2c542f3c2e7b@gmail.com>
Date: Mon, 1 Jun 2026 09:48:58 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Amit Sunil Dhamne <amitsd@google.com>,
 Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2026 13:18, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
