Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACAAD527
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 18:52:08 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id o4so9464691ljp.8
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gdWn4WdaMz/orHTAzTV9G0nntj7JTXh23bqgGD28ww=;
        b=IlIMFaVvVPTKibfA9BQgsl6WlDe6xi3m4idFQLiURGOQyhN8GFQQQFzvvyRXnD8he2
         T21zJmDFV5DckThnOPksEsSfiJFBvQMprH0xtSSfAtSpn6zO0Cjc0Yxtp+LtKIrGQg/y
         PLw1kC73/9lVhboHHGzJAx4oKBDtFV5mbkgd2T+lfZZcj8x2kiEVbX7den29NDjlH8g2
         9BMCYYXGQDcCy/6qYq3d07fXwrupU0vQ+syCzOwFPxgcAl/EBYglrHaJ7NSuzDZzavN6
         w7yLPQSUXCBZbsXsiYpnc+oaYjOvAffoqDkuxgGmsLUoVgfxJxYbbzG+x36N03gai0sN
         OWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gdWn4WdaMz/orHTAzTV9G0nntj7JTXh23bqgGD28ww=;
        b=YSjZiXQtrwn7YheqyuTuVsH0VAckjMNJLtD5c8FR8tDYJSvQokEdTv1zVeh3y6MfRt
         O34iyBhoawTBEvmBWLzqA0aucr60CEHFB0VYWXDMHWY4sQJyfUR2DLwL2yLYYHV+lqgm
         uxg+YIDFKE1PnCzcgEaCNdI9Gx58cok/0aRdPuh+eS3/3gjKhLfEwI+il0D9eiNljeHb
         oBfoKrcTqkTA4B91vF1uyWLEKN9MYkhI7CUL/HblUc8LTOdhjWbwy/sCjptDwvG8H9S6
         dhBNghcV3kDlqCN1M08wQE/VFr38Kmke+L+nGRz6LqA0+hbJFEziVTVvAIO4wNNiZf2X
         4dqA==
X-Gm-Message-State: ACrzQf2rYS32gXvHihMVJ3ywnLRe2mbTFG/UUIMgj9q5YyaOprRU7L5s
	BSs9ezWL0BbtfSvTK5HXzaRbn4v7GBMl4doDJWVFp9KmcwukUA==
X-Google-Smtp-Source: AMsMyM5VRH4ZpCY4vOTfbRgY2tlY1P3ky5WrY7Fz0QRermYZFqN2uaE/zebFoOjmW7Y2t2HShLgeo8qoKuu7FMxmtTc=
X-Received: by 2002:a05:651c:1073:b0:277:35ca:5eef with SMTP id
 y19-20020a05651c107300b0027735ca5eefmr372209ljm.150.1666983126676; Fri, 28
 Oct 2022 11:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028165215.43662-1-fnkl.kernel@gmail.com> <20221028165215.43662-3-fnkl.kernel@gmail.com>
 <02523fe5-bf99-9891-d00c-347893d5dabe@linaro.org>
In-Reply-To: <02523fe5-bf99-9891-d00c-347893d5dabe@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 28 Oct 2022 21:51:55 +0300
Message-ID: <CAMT+MTTE84XDf8c0D3MLxZ92HiDP6DhXfpHVyQZ7hfYMUkL7dg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pwm: Add Apple PWM controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Oct 2022 at 20:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2022 12:52, Sasha Finkelstein wrote:
> > +config PWM_APPLE
> > +     tristate "Apple SoC PWM support"
> > +     depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
>
> Why this code cannot be build on 32-bit?
It uses 64-bit divisions, which causes it to fail to build on 32-bit
mips. It should not be a
problem, since this hardware is only present on 64-bit SoCs.
