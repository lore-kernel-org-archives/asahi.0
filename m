Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94975211F
	for <asahi@lists.linux.dev>; Wed,  4 May 2022 11:29:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id k126so684214wme.2
        for <asahi@lists.linux.dev>; Wed, 04 May 2022 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=Lx2qLsKs38Eir+EgOxVI8/2cAPOLnndn7kfUP86lgH8+aal4sD2/I4diO4wjz8zEtB
         a3vhf3Vi/JLQcbG1rjExve3qNUOFGHCr/OyqNyAXgUUUZuXTPFsCIkTNRZvWyEsnSb4K
         tApJGZtG+Ey943HYMUj2vnHeYDTfwMEFASmqOl3YtrSKPen9Rt8vKCFdl9dCO/rSAadC
         TTTaiTmsBPUqYJjFv9EoPQcL3YtAcg8zm9EyDcxbd100K9/XVsyH9dRU1RAHFjh2rzvI
         T4a0rvYdc3mILv7A277j+bk588fPYwZavDXuXPW7gknR1NfjVY0/c2KpR+ZQN10KfFej
         YCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=lk+Z77ry+urJV2yBm9wG9hu1zKcldG5rbyIyUVp9tiqGjvOrcavF3tjZnQopAIuCFc
         B75tOrbkok1R4swtJoOybxtC4PHOgpgNROp4niitz35/qXep3bqfdUu0WWTOVahjCFSm
         l+IE7KpBpmj020yiPQFEhXU1IM4hdQTmKvQNbr4CTNfCzaXAYSGbRyFSs/ZoKVRTaT68
         83sGxp9Fapy1C89U/3+m4SCjIPqTbKGjma0vEcXJ5ELi+f0+wnpIb0k7Ja/OnoZ9P8jy
         y5DPFt+NMnXoNXT8gOE6OY75S+lGBXiQ74f3jYgo6Ry1OLreFQY7CmHCH3MhXgZ3jvsC
         ZCeA==
X-Gm-Message-State: AOAM531EXlfqpIovyB1hehjM8KsML5btX6tThKObI/R782f/Z5jg/P2n
	1N3xjBOo74rEhAfWoGqOivNWrNNiqvlYfD77CwcranJtSvy+3Q==
X-Google-Smtp-Source: ABdhPJz8Ome1gAzalZtJSQIv7AmGf9EoXoSU1Hr12WcAVH3wwEfD+JOIlx5+tvAgF73kUxepyvkk7AbiUCFvfTPVYPY=
X-Received: by 2002:a1c:19c1:0:b0:393:a19f:8f95 with SMTP id
 184-20020a1c19c1000000b00393a19f8f95mr7272203wmz.149.1651663789722; Wed, 04
 May 2022 04:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Wed, 4 May 2022 16:59:38 +0530
Message-ID: <CAH=dH9_hP02JyV+T4wF77=juheNxptPQfGL2s+Pshr-i3OJ6kQ@mail.gmail.com>
Subject: Test Mail to Asahi
To: asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
