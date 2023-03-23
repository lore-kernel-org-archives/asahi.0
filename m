Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DB3C04
	for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679566758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coqjmjk6xTYfq/k9FbHyeBz4n2qs9gX3DbZ21S5gxLM=;
	b=BmQHZ7+D50t162AmpzzS4W40bDYTmXLUsqPhYna+tFquu0IJ6VWvrMp0GWwlqgmJ3jo82g
	I1zMoE6qpbYwpz0TUAAeoAJOIZSfDU3QwhqPPNBXcDsp4vhIb+HBmK+8XQ43lMMUj+mzj6
	cafvJgNIUK1vFNPoPawOMT2N1zBuSV0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-wq_rUSG0ONytQuQNLfGhwQ-1; Thu, 23 Mar 2023 06:19:16 -0400
X-MC-Unique: wq_rUSG0ONytQuQNLfGhwQ-1
Received: by mail-ua1-f71.google.com with SMTP id z4-20020ab05cc4000000b0076095468c75so7938192uaf.20
        for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679566756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coqjmjk6xTYfq/k9FbHyeBz4n2qs9gX3DbZ21S5gxLM=;
        b=NCGZRz5VLMstiFW2mcr7jAF/okZd9oHwoKEfBvGZgwrgQwjKZCgcfvFm/zJjN22CYC
         21OrpmlGPNg/NQ9Y4J1zVrXyz0QqBQNvHdaVPHG1S4s+u+YVOuy5mJK2IP/4Cd9+2ONb
         xs+M6zMswsERKzBMFORDhI4yuraxXlAX0lc/jL80DfE26uwebxDNCWpn8tWblNPIhAQ8
         4Jdo8DJMorc6P7Kb9Igw/R+xCcbfIupAIf7JTnRPS7fRPEmQcdDJEjfRUyUwTY7kkuAP
         Qlxtmf4GBwLq58x7BLHOtgnH0chulfa7mUoRtkZ6MfsANRRfUqML5qaixsX7kIGWusz8
         FoFw==
X-Gm-Message-State: AO0yUKVLYeywWsZbHuXJFoh7Dhyvn4AcwsLsJOnughVbvkgRSXaAafFD
	P7MN1n6Tlo4AQi6ucIFopFBNYZPDmnotGR5EvFsjfM20DiNtX+x6eq+hiY6umRb5oEX6jFAkKWD
	9j7MdaLyyI5qxs1OBvVmXEAcxoUHonLQ=
X-Received: by 2002:a67:c806:0:b0:421:eabb:cd6a with SMTP id u6-20020a67c806000000b00421eabbcd6amr1484065vsk.7.1679566756125;
        Thu, 23 Mar 2023 03:19:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set9bO436jAIPrYPp1c17CTG8//r0fD/7JbusN2dBE31dz0Yy7ZQYwg0mGeQ3xuA+3IGEeGVsjShUmMO/0Fz63Is=
X-Received: by 2002:a67:c806:0:b0:421:eabb:cd6a with SMTP id
 u6-20020a67c806000000b00421eabbcd6amr1484057vsk.7.1679566755845; Thu, 23 Mar
 2023 03:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-apple_pcie_disabled_ports-v3-1-0dfb908f5976@jannau.net>
In-Reply-To: <20230307-apple_pcie_disabled_ports-v3-1-0dfb908f5976@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 23 Mar 2023 10:19:00 +0000
Message-ID: <CAOgh=Fy6XsRFquqKMvMkbaCpowJf6twmRwkqoo_Fm1_O02n7bQ@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: apple: Set only available ports up
To: Janne Grunau <j@jannau.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Sven Peter <sven@svenpeter.dev>, 
	linux-pci@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Mar 2023 at 08:16, Janne Grunau <j@jannau.net> wrote:
>
> The Apple SoC devicetrees used to delete unused PCIe ports. Avoid to set
> up disabled PCIe ports to keep the previous behaviour. MacOS initialized
> also only ports with a known device.
>
> Use for_each_available_child_of_node instead of for_each_child_of_node
> which takes the "status" property into account.
>
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>

Tested this on Asahi Fedora Remix kernel-edge on Mac Mini M1.

Tested-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Changes in v3:
> - dropped Cc: stable
> - rewritten commit message since the warning is fixed by 6fffbc7ae137 ("PCI: Honor firmware's
> device disabled status")
> - Link to v2: https://lore.kernel.org/r/20230307-apple_pcie_disabled_ports-v2-1-c3bd1fd278a4@jannau.net
>
> Changes in v2:
> - rewritten commit message with more details and corrections
> - collected Marc's "Reviewed-by:"
> - Link to v1: https://lore.kernel.org/r/20230307-apple_pcie_disabled_ports-v1-1-b32ef91faf19@jannau.net
> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 66f37e403a09..f8670a032f7a 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -783,7 +783,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>         cfg->priv = pcie;
>         INIT_LIST_HEAD(&pcie->ports);
>
> -       for_each_child_of_node(dev->of_node, of_port) {
> +       for_each_available_child_of_node(dev->of_node, of_port) {
>                 ret = apple_pcie_setup_port(pcie, of_port);
>                 if (ret) {
>                         dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
>
> ---
> base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
> change-id: 20230307-apple_pcie_disabled_ports-0c17fb7a4738
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

