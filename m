Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C042BEC
	for <asahi@lists.linux.dev>; Fri, 22 Sep 2023 17:16:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c47309a8ccso28065775ad.1
        for <asahi@lists.linux.dev>; Fri, 22 Sep 2023 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695402967; x=1696007767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
        b=RdV6OnnT5VQPxEKcVJ77ryBYMzMaOZrAEpBovo4Yh6+SBlnxTJHQys11yLgB4+KvgT
         DKf4AyVaUZc9aG24UAGJ7TfqVsGk6GzMQXrv2IMGhLcvsvmOkJgJrWJGCsTNEdjMgJvm
         a1a8N8dzeHOhwvahkaXrQvzLhmPvghM7CjQNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695402967; x=1696007767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
        b=nnyi0cd3BWUJMyMVyV5ix9PX8YvNvTJ56OlhvcgmPuzWWdt05IhBPUFuaFe3RyDgDO
         bCw0t/llIgVQyOhJ57NCS/GHZDp3O3sbHB19yU/UCG1aq6JJJOzLCAAFQtOCHsTkO6Nx
         MjxuutWhdPKF6yXTKVSybv1K1k5Rbx2v7+qjCZBqiql/URSTMBShcbZOOGFcFqFdAve0
         yPEM3KPANghU5EFTi9chePY3Bxb1DeYSi0SlWoHQ26hiim4yB+N9Qm1jMuQ21LV1cOt+
         7teA+Qi77Wf+F99rqFR+/ARagX3HNO9saBG7Wv5ob+LtjxAf4ZC/S3IXAhX9Swi1T5q3
         3dag==
X-Gm-Message-State: AOJu0YyYRwMKbVm/Ty8+Z2WXPm+GKjn2m7UKXqH1ZjUlPeJdJMsVGSPp
	FzoUpsgImh0NENWxEa/yKe2vhw==
X-Google-Smtp-Source: AGHT+IEetMJnHs5bBcV9L3R6HPyKeQTS1z7sgSklrhHfcojQhz5I0wr5ShzBfZ21ocAxIbhohXa34w==
X-Received: by 2002:a17:902:a416:b0:1c5:ecfc:2650 with SMTP id p22-20020a170902a41600b001c5ecfc2650mr2175732plq.14.1695402967593;
        Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001bdbe6c86a9sm3742195plb.225.2023.09.22.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Date: Fri, 22 Sep 2023 10:16:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Zhou Wang <wangzhou1@hisilicon.com>, Jie Hai <haijie1@huawei.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Green Wan <green.wan@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jordy Zomer <jordy@pwning.systems>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/21] dmaengine: Annotate with __counted_by
Message-ID: <202309221015.AB63726@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <202309151307.F3341BD5A@keescook>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309151307.F3341BD5A@keescook>

On Fri, Sep 15, 2023 at 01:08:30PM -0700, Kees Cook wrote:
> Just a ping on the series... how do these look to you, Vinod?
> 
> If you want I can carry them in my tree. Please let me know.

I'm now carrying this in my for-next/hardening tree. Let me know if
you'd prefer I drop it.

Thanks!

-Kees

-- 
Kees Cook
