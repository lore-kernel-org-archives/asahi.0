Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF623AF
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 18:36:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f13so57756148edz.6
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 10:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677695792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT/OJ9n++mt401vNDY8xHJSNHWuHKsSIBHt696WINAU=;
        b=AM+m+uN/GMfoZa8x0kGd9ILKdXLTOuUR42eX+12yd+cajJEuJwDRf7S+NMLKb9/3dT
         CCEJnwW7v/DV+5rMKvy5veRJtURY0jJvbjq10qTXNbD4G1TiEHNP03aaz3vOPYr+4J+e
         c1PQAQZYUABegvNFy8LtqkT6Ce9TGgKJScTB34Spb/xScy2qe9i98NeCqsPq4yBEU6F8
         PnWFSHZnHKpEFR/CYBsAVKMQnioW84wwfS7oxLTClii4+3L0i77KDMoxp9K9ZLZuUh9H
         KHwcjnaRA7XSq7euj/+N1Ar+Ws3LeiSVr/oH7UVTSjiaqpn9VmxJI2Gtth90BC5XuQvr
         hDsQ==
X-Gm-Message-State: AO0yUKXaRdB8aOyEpM8b1gI1iwyYM7jJRdtGkELeHu3bmkMPM7fmu9Dh
	u5REK+mMvJm/oWUBVvZYeQm+vdalXCyI/SxTOu8=
X-Google-Smtp-Source: AK7set/H2etJvYe1d1itJBx6hspBD30RZmx5cJZgLeGAW0PK9sgtTvz5euwqOQWEzRFywRWOoz9kl56jMNflDNjzbOs=
X-Received: by 2002:a17:906:7687:b0:8ad:731:592d with SMTP id
 o7-20020a170906768700b008ad0731592dmr3628118ejm.5.1677695792428; Wed, 01 Mar
 2023 10:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y/yAzR6sWvPedLej@kili> <CAOgh=FyxFuENe6SgJB7aUwPS-ZB_51q6a=zWEcZSAsGqX034hA@mail.gmail.com>
In-Reply-To: <CAOgh=FyxFuENe6SgJB7aUwPS-ZB_51q6a=zWEcZSAsGqX034hA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 1 Mar 2023 19:36:21 +0100
Message-ID: <CAJZ5v0jMm25S2M2g2oB9fE+U1SJO8w5Y87ENwOQ4JpPTAH6XEQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix an IS_ERR() vs NULL check
To: Eric Curtin <ecurtin@redhat.com>, Dan Carpenter <error27@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev, 
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 27, 2023 at 11:26 AM Eric Curtin <ecurtin@redhat.com> wrote:
>
> On Mon, 27 Feb 2023 at 10:16, Dan Carpenter <error27@gmail.com> wrote:
> >
> > The of_iomap() function returns NULL if it fails.  It never returns
> > error pointers.  Fix the check accordingly.
> >
> > Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
>
> Nice catch!
>
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Applied as 6.3-rc material, thanks!
