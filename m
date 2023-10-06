Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645F28692
	for <asahi@lists.linux.dev>; Fri,  6 Oct 2023 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EsXlfWcD"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57be3d8e738so1332077eaf.1
        for <asahi@lists.linux.dev>; Fri, 06 Oct 2023 13:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623777; x=1697228577; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8kAE0L3XYT2zduhiLheo6/OoQQtkbHtadi2JLu6gYg=;
        b=EsXlfWcDkF7d8EuSgiFYgTX5HS3WpRXG0NVBIHqMHzpGJ4Mtp+T5U9HbW3dbsa8vEY
         1pdQqgDxhQUqucGXeQF5Df+kQkEWulMW93lSWiWjlNAb848+s4u4AC1TWK1lT9HN26GH
         /nEz9zKoXOSZXAz2Kd4LKq5j5PYgoV6jLPb6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623777; x=1697228577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8kAE0L3XYT2zduhiLheo6/OoQQtkbHtadi2JLu6gYg=;
        b=NEni84P0duHRO19HYB87TFvAXwHddFTD7F629W9OCMWrGuHcs+p6wSI03sARuMJ9XF
         gTrgEOEBK1xVa6KP2yNb+nHZjrBaH8L21TOJOvMGedVvku1IFEeZwQ6xP9bQZYzd8GTR
         Swzs+08girf7VmpO8C4L/MvtTe3DEex3AKpjq7gySMUANfDk2RIuaDzEvQvpIIwEq0b3
         SOLhAtzHct06l4doxpJ1CiiQXR7la4fyieb+1q7Btmx+FMd7NXndvGnZeRnSVzl117OJ
         2+ZKh4iBBekLQu3881g9ZBlcVgIDykjCCS7npqPWVCIXIwhpvlRme/tavND8xx6VYnkg
         u8JQ==
X-Gm-Message-State: AOJu0YzVgfS/iNzt7qdH4Ds5wjGh+usNRDkg3yRCJr10BlM03eSPTgu/
	lsnIt2SvWpywdprWU+mhx0OR6g==
X-Google-Smtp-Source: AGHT+IFJgYFdXQLoiEQmx+lFHyuC0qUrDFQKLIKGfw/wrLmvAN6GJdpM5ZD/9ihDG8TtTiEFnZjYhg==
X-Received: by 2002:a05:6358:9691:b0:164:8742:525 with SMTP id o17-20020a056358969100b0016487420525mr1346056rwa.17.1696623777190;
        Fri, 06 Oct 2023 13:22:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 19-20020a17090a1a1300b00273744e6eccsm4271576pjk.12.2023.10.06.13.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:22:56 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:22:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
	alsa-devel@alsa-project.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310061321.E7247C52B@keescook>
References: <20230922175050.work.819-kees@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922175050.work.819-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:50:50AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mca_data.

Friendly ping. Mark, can you pick this up please?

Thanks!

-Kees

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: "Martin Povišer" <povik+lin@cutebit.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: asahi@lists.linux.dev
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  sound/soc/apple/mca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> index ce77934f3eef..99e547ef95e6 100644
> --- a/sound/soc/apple/mca.c
> +++ b/sound/soc/apple/mca.c
> @@ -161,7 +161,7 @@ struct mca_data {
>  	struct mutex port_mutex;
>  
>  	int nclusters;
> -	struct mca_cluster clusters[];
> +	struct mca_cluster clusters[] __counted_by(nclusters);
>  };
>  
>  static void mca_modify(struct mca_cluster *cl, int regoffset, u32 mask, u32 val)
> -- 
> 2.34.1
> 

-- 
Kees Cook
