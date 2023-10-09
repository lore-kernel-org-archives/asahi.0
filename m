Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7B3C69C
	for <asahi@lists.linux.dev>; Mon,  9 Oct 2023 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSarhJpz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-694f75deb1aso4347896b3a.0
        for <asahi@lists.linux.dev>; Mon, 09 Oct 2023 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881100; x=1697485900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=iSarhJpzlZ8JbQl+QOQ8zCj/d9y+4WgtpQKrVGIwsEOcxiZlB7sqvYphP8qKHe2htL
         1awThamgJiUpVnT4bHv9+rK7IDV4q+I4c4o/yQ+TVsBHMXIOzX3V4Y4OxaU0TlrFzuaE
         CHbysyI10/g6t6MezcNBq5ZHFH8Qp7tyvIrVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881100; x=1697485900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=bB2zZjot14zC0bqIuko+2QlK9YHw8Y1OX42bMcU45s+r4qH15rzkdGPS6MxA8hhAu0
         qBIGbamOqVhmw8IpvZQb+05fQiPOLPw1YlOgukf3noH/1Klb8AlYsQBbw1FtZSLSS47q
         0FcWfFMWXjpg49g1S3DoDWkpI2RJiqpz/KTjonMmwGscjRjAq2EiiZfdVSZmfhO+Z/Cv
         Ri/L5d/tcNkmmp2UH8dvNHHG5aVFUlHCi6fwMaZ3wdBNIzEI2B+P1SEyGf0t2xekplyi
         9WqmEh3jBQOtnVzsx6YEk0HXe0Y4hleZc0xUCbowUrQNihHdRg+PALQg4k+JOflfEpKc
         36yw==
X-Gm-Message-State: AOJu0YyvLtXCH4+ZO4lIWOAksX3oLnaRks6JNx9dycx75e9KvjwQbA65
	r3sq9zlAiRdJpA7Dy7Rj9J9wWA==
X-Google-Smtp-Source: AGHT+IErKu5nijcGQNO4C5TTmPCzq/DLxiROmTLvRJ5rM8E6o7Mvo2fsCJGqYmjn1eMmUSEOjczf4w==
X-Received: by 2002:a17:90b:4d8b:b0:27c:df02:88b3 with SMTP id oj11-20020a17090b4d8b00b0027cdf0288b3mr787340pjb.8.1696881099801;
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ct19-20020a17090af59300b0026b3a86b0d5sm8806769pjb.33.2023.10.09.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:51:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310091251.B877B4AF@keescook>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
 <202310090958.27F5025BDB@keescook>
 <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>

On Mon, Oct 09, 2023 at 08:43:44PM +0100, Mark Brown wrote:
> Off the top of my head I'd say wait at least three weeks for this sort
> of patch before doing anything and then prefer to do a resend, that's
> should avoid most issues.  If you're going to just apply things yourself
> I'd suggest waiting for -rc6 or so before doing so (assuming the patches
> were initially sent reasonably early), that does seem like a reasonable
> backstop so things don't completely miss releases.

Okay, sounds good. Thanks for the clarification!

-- 
Kees Cook
