Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB134B1A4
	for <asahi@lists.linux.dev>; Tue,  7 Apr 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775528442; cv=none; b=tY+JE1xXMelY8ShAQ2Z6MlBhvSCaXwWxH16tpLlH73ZzD7X44kKCbh+pi7AvmbHCfySM79ECVXbMUzDxXGcSL4Z9nJCOU3MaTmjBl2uPUaZUTC0kE51fcy+asvZEM4ISEPJSJJh4rIBJLiJyneOytMLNvb4dJJagRMK7q3ed+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775528442; c=relaxed/simple;
	bh=LNl598CtverB6RoVHWavFb380/eHEY1x3g4dSUTb7wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGaXZOaOWLSDo8+vln8FvOvmCG8DGae70hmrFZC4xsGqCJWB9wxGNRA/SDsy9O0CbMvwU5Zqg+UdAvuBF+CjmiZNEVET6hBIBTsWo1+5q8DVw/qKruFtmArqIFLPHUdY1McQVDawoVui1vnanLXkk7LonWMZDFzxrdrhJ5TGroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=V6fh3diO; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="V6fh3diO"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d9bba96f7dso2384414a34.1
        for <asahi@lists.linux.dev>; Mon, 06 Apr 2026 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775528437; x=1776133237; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj0K5FyMi7XSuPG2uq1mtZavJKlMVDQzSk2zMk1W2/0=;
        b=V6fh3diO5to2aU9lLYgUkvDvxnYbKZdSZtC3CfkuubC/IZ7pS5bseM47IpqppDE+ii
         0JXLczLLr0vZ3JkP0s6WrE/5+pIGV7zORpagEdhE1lU55pgUa+LGspAU4C9aaKzild8B
         dnHymi9emvAykBXHkl4pZtGtOdNQJQDDvGJIO4lUO1F8Hoas+4+orivAsaA4qU+N8lpm
         unmEh5dS+5YGMB41ILT6xHWUziQhvO5fBxBRLzsAM8zlgdbDGbRgNagb5Ip+ypOu7NH/
         wnXCTTwK4WCK37qorQMt8OZKKNCoGUujp0XJEguUDkgC3hgOlebT93T9yvoB35D7A0No
         Y7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528437; x=1776133237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj0K5FyMi7XSuPG2uq1mtZavJKlMVDQzSk2zMk1W2/0=;
        b=P3YS1RWtXp4QQ8xFTES8oN72VIw68iAKEIbXdWO7xY9gvqcclbZSJ580LcN+FPcg5J
         iMHjn5MGlL1RkzCKlZ7HSB8tY5L19dcoB5QN8OgU5OYCHAzNPP9RZ8G7el4dMvJvJL5k
         cxxZLh7tMSrXyfObLFIzDQZok98YEqDKxNtpd8QZopRjNFIQ8uEPzGPeRrrCeUhSVoSY
         sP9wBs+l7Cm2i4tp+npXesQRgvPF+4xdu7iqQ7Jey7Lm1rh1QjxlRWjZDlzoNcfSnmLU
         L3ekSbOWyPvGbHFq2Ifw6orwGRpQtBeolXhoF8GAfkn5lAvf8gRXhu3lnvVrXDd5KpiU
         5EEw==
X-Forwarded-Encrypted: i=1; AJvYcCXizlrs3EotzwwVWOcURUpwH50siOC/hKEl1HMkg6kQOpDb2sLowWyYnoR1EmQvu9IN+O7GBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYNCu+CtjqJvM59pkBB/tDndDYObwJk5uSXLda4g0aS0mn6RjV
	e1nYDk/t6jDkCMUestnmFgeRFJVyEgFBdElEr1oOxPR3p8WQfqtrnZy4JtovaJs/sbw=
X-Gm-Gg: AeBDievLpBFExCZMwkBg2/JaH3kLiTfFhd8Pe2g2fIcZNCxCujcnyDTSnFUYu/hSAog
	mUdpQ42CpMBW+iOis0tUwgr41RhaDvAtrmk+ZJlFLc/1O/f7EuB1SKNff4XNmaWHWyQbJhdj4ml
	vCDfehBP03g7dusIkDw07M2im7G+Ud3dz4vS2H2vJf0HQuEtnCUXbLWevw9Qtrhv0dSH2OvDsBE
	dWbOni0ozLPodgryfMFwXpEljmf/cBq4wx8zSDG6orqS5EKGWYZARmOliIdenOdt/EwJ0Ims9EE
	z3v4JlItyP54gmqet0TbNej4spzV351RomKqnTUR5zCctH9Ft/pDwupYrWW3ayQf5bA/cRa5wzS
	1mjJdzx+soyB6JCP/xhnU3D44hHnrB7h0TPvV9Mu30P55FfxxE9GIQQgHrQYOcYYZapE/E1Zy9o
	zfQkTXOa5eNr8k/qpDIHWl3cy9RyIOkDd1dZNaCHkpOMxI/qiQZExlLatMj7u3jWYKY9j1efUO4
	f6/t1l5aQ==
X-Received: by 2002:a05:6830:83af:b0:7db:b68f:b819 with SMTP id 46e09a7af769-7dbb6f25a6emr9575077a34.6.1775528437568;
        Mon, 06 Apr 2026 19:20:37 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbd663a4a5sm4895363a34.25.2026.04.06.19.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:20:37 -0700 (PDT)
Message-ID: <8143e057-4c3b-4365-8780-003e897b9baf@kernel.dk>
Date: Mon, 6 Apr 2026 20:20:35 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-apple: drop invalid put of admin queue reference
 count
To: Fedor Pchelkin <pchelkin@ispras.ru>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Sagi Grimberg <sagi@grimberg.me>,
 Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, "Heyne, Maximilian" <mheyne@amazon.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20260403202701.991276-1-pchelkin@ispras.ru>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260403202701.991276-1-pchelkin@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 2:27 PM, Fedor Pchelkin wrote:
> Commit 03b3bcd319b3 ("nvme: fix admin request_queue lifetime") moved the
> admin queue reference ->put call into nvme_free_ctrl() - a controller
> device release callback performed for every nvme driver doing
> nvme_init_ctrl().
> 
> nvme-apple sets refcount of the admin queue to 1 at allocation during the
> probe function and then puts it twice now:
> 
> nvme_free_ctrl()
>   blk_put_queue(ctrl->admin_q) // #1
>   ->free_ctrl()
>     apple_nvme_free_ctrl()
>       blk_put_queue(anv->ctrl.admin_q) // #2
> 
> Note that there is a commit 941f7298c70c ("nvme-apple: remove an extra
> queue reference") which intended to drop having an extra admin queue
> reference.  Looks like at that moment it accidentally fixed a refcount
> leak, which existed since the driver's introduction.  There were an
> initial ->set and an extra ->get call at driver's probe function, and only
> a single ->put inside apple_nvme_free_ctrl().
> 
> However now after commit 03b3bcd319b3 ("nvme: fix admin request_queue
> lifetime") the refcount is imbalanced again.  Fix it by removing extra
> ->put call from apple_nvme_free_ctrl().  Compile tested only.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 03b3bcd319b3 ("nvme: fix admin request_queue lifetime")
> Cc: stable@vger.kernel.org # depends on 941f7298c70c
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
> 
> Also nvme-apple seems not to have a blk_mq_destroy_queue() call for
> admin queue since introduction - if it's needed, the proper place would
> be in apple_nvme_remove() just before calling nvme_uninit_ctrl(), I guess?
> 
>  drivers/nvme/host/apple.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index ed61b97fde59..1d82f0541b0b 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1269,8 +1269,6 @@ static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
>  {
>  	struct apple_nvme *anv = ctrl_to_apple_nvme(ctrl);
>  
> -	if (anv->ctrl.admin_q)
> -		blk_put_queue(anv->ctrl.admin_q);
>  	put_device(anv->dev);
>  }

Could this just be:

static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
{
	put_device(ctrl->dev);
}

at this point?

-- 
Jens Axboe
