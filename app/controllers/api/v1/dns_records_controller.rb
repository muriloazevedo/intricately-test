module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records 
      def index
        service = DnsRecords::Index.new(index_params)
        dns_records = service.call
        render json: dns_records, status: :ok
      end

      # POST /dns_records
      def create
        service = DnsRecords::Create.new(dns_records)
        service.call
        render json: { id: service.model.id }, status: :created
      end

      def index_params
        params.require(:page)
      end

      def dns_records
        params.require(:dns_records).permit(:ip, :page, :included, :excluded, hostnames_attributes: [:hostname])
      end

      def missing_params
        render json: {}, status: :unprocessable_entity
      end
    end
  end
end
